package myoa.entity;

public class ActivityActor {
	
	private int id;
	private int activityId;
	private int actorId;
	
	public ActivityActor() {}
	
	public ActivityActor(int id, int activityId, int actorId) {
		this.id = id;
		this.activityId = activityId;
		this.actorId = actorId;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getActivityId() {
		return activityId;
	}
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	public int getActorId() {
		return actorId;
	}
	public void setActorId(int actorId) {
		this.actorId = actorId;
	}
	
}
