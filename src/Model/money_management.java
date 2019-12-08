package Model;


public class money_management {
	int ID;
	 String money;
	 String date;
	 String explain;
	 int type;
	public money_management(String money, String date, String explain, int type) {
		super();
		this.money = money;
		this.date = date;
		this.explain = explain;
		this.type = type;
	}
	public money_management() {
		// TODO Auto-generated constructor stub
	}
	 public int getID() {
			return ID;
		}
		public void setID(int iD) {
			ID = iD;
		}
		public String getMoney() {
			return money;
		}
		public void setMoney(String money) {
			this.money = money;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getExplain() {
			return explain;
		}
		public void setExplain(String explain) {
			this.explain = explain;
		}
		public int getType() {
			return type;
		}
		public void setType(int type) {
			this.type = type;
		}
}