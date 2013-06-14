 static struct sched_entity *__pick_next_entity(struct cfs_rq *cfs_rq)
 {
-	struct rb_node *left = cfs_rq->rb_leftmost;
+	struct rb_node *left;
+	struct sched_entity *curr;
+
+	curr = rb_entry(cfs_rq->rb_leftmost, struct sched_entity, run_node);
+
+	if(&curr->run_node == cfs_rq->rb_leftmost) {
+		__dequeue_entity(cfs_rq, curr);
+		curr->load.weight = 0;
+		__enqueue_entity(cfs_rq, curr);
+	}
+	
+	left = cfs_rq->rb_leftmost;
 
 	if (!left)
 		return NULL;
-
+	
 	return rb_entry(left, struct sched_entity, run_node);
 }
 
