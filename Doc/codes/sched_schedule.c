/*
 * schedule() is the main scheduler function.
 */
asmlinkage void __sched schedule(void)
{
        struct task_struct *prev, *next;
        unsigned long *switch_count;
        struct rq *rq;
        int cpu;

need_resched:
        preempt_disable();
        cpu = smp_processor_id();
        rq = cpu_rq(cpu);
        rcu_sched_qs(cpu);
        prev = rq->curr;
        switch_count = &prev->nivcsw;

        release_kernel_lock(prev);
need_resched_nonpreemptible:

        schedule_debug(prev);

        if (sched_feat(HRTICK))
                hrtick_clear(rq);

        raw_spin_lock_irq(&rq->lock);
        update_rq_clock(rq);
        clear_tsk_need_resched(prev);

	        if (prev->state && !(preempt_count() & PREEMPT_ACTIVE)) {
                if (unlikely(signal_pending_state(prev->state, prev)))
                        prev->state = TASK_RUNNING;
                else
                        deactivate_task(rq, prev, 1);
                switch_count = &prev->nvcsw;
        }

        pre_schedule(rq, prev);

        if (unlikely(!rq->nr_running))
                idle_balance(cpu, rq);

        put_prev_task(rq, prev);
        next = pick_next_task(rq);

        if (likely(prev != next)) {
                sched_info_switch(prev, next);
                perf_event_task_sched_out(prev, next);

                rq->nr_switches++;
                rq->curr = next;
                ++*switch_count;

                context_switch(rq, prev, next); /* unlocks the rq */

