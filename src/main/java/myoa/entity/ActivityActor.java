package myoa.entity;

public class ActivityActor {
	
	private int id;
	private Activity activity;
	private Employee employee;
	
	public ActivityActor() {}
	
	public ActivityActor(int id, Activity activity, Employee employee) {
		this.id = id;
		this.employee = employee;
		this.activity = activity;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
}
