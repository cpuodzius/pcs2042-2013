static struct task_struct *pick_next_task_fair(struct rq *rq)
{
        struct task_struct *p;
        struct cfs_rq *cfs_rq = &rq->cfs;
        struct sched_entity *se;

        if (!cfs_rq->nr_running)
                return NULL;

        se = pick_next_entity(cfs_rq);
        set_next_entity(cfs_rq, se);
        cfs_rq = group_cfs_rq(se);

        p = task_of(se);
        hrtick_start_fair(rq, p);

        return p;
}

