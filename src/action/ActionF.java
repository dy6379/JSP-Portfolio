package action;

public class ActionF {
	//생성자, 코딩오류를 줄이기 위하여 private사용
	private ActionF() {
		super();
	}
	private static ActionF instance = new ActionF();
	
    //ActionF클래스 싱글톤패턴으로
	public static ActionF getInstance() {
		return instance;
	}
	
    //command에 맞는 action을 생산한다.
	public Action getAction(String command) {
	    Action action = null;
	    if (command != null) {
	        if (command.equals("board_list")) {
	            action = new BoardListAction();
	        } else if (command.equals("board_write_form")) {
	            action = new BoardWriteFormAction();
	        } else if (command.equals("board_write")) {
	            action = new BoardWriteAction();
	        } else if (command.equals("board_view")) {
	            action = new BoardViewAction();
	        } else if (command.equals("board_check_pass_form")) {
	            action = (Action) new BoardPassCheckFormAction();
	        } else if (command.equals("board_check_pass")) {
	            action = (Action) new BoardPassCheckAction();
	        } else if (command.equals("board_update_form")) {
	            action = new BoardUpdateFormAction();
	        } else if (command.equals("board_update")) {
	            action = new BoardUpdateAction();
	        } else if (command.equals("board_delete")) {
	            action = new BoardDeleteAction();
	        }
	    }

	    if (action == null) {
	        action = new BoardDeleteAction();
	    }
	    return action;
	}

}
