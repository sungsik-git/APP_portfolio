package com.cardfit.www.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.www.DTO.CategoryDTO;
import com.cardfit.www.DTO.CompanyInfoDTO;
import com.cardfit.www.DTO.CounsellerInfoDTO;
import com.cardfit.www.DTO.DirectDTO;
import com.cardfit.www.DTO.IssuanceDTO;
import com.cardfit.www.DTO.MemberInfoDTO;
import com.cardfit.www.DTO.NoticeDTO;
import com.cardfit.www.DTO.UserIssuanceDTO;

public class ManagerDAO {
	private static ManagerDAO managerDAO = new ManagerDAO();
	private final String CONNECTION_POOL_RESOURCE = "jdbc/cardfit";
	/*데이터베이스 테이블명*/
	private final String MEMBERINFO_TABLE = "MemberInfo";
	private final String COMPANYINFO_TALBE = "companyInfo"; 
	private final String LARGECATEGORY_TABLE = "LargeCategory";
	private final String SMALLCATEGORY_TABLE = "SmallCategory";
	private final String COUNSELLERINFO_TABLE = "counsellerinfo";
	private final String DIRECTANSWER_TABLE = "directAnswer";
	private final String DIRECTINQIRY_TABLE = "directInqiry";
	private final String CARDINFO_TABLE = "cardInfo";
	private final String NOTICE_TABLE = "notice";
	private final String ISSUANCE_TABLE = "issuance";

	private int sizeOfCounsellePage = 16;
	private int sizeOfMemberPage = 16;
	private int sizeOfCardPage = 20;
	private int sizeOfNoticePage = 16;
	private int sizeOfIssuancePage = 16;
	private int sizeOfRankingList = 5;

	private DataSource dataSource;


	private ManagerDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE);
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static ManagerDAO getManagerDAO() {
		return managerDAO;
	}

	/* 상담사 로그인 DAO */
	public int login(String id, String pw) {
		final String LOGIN_SQL = "SELECT id, pw FROM " + COUNSELLERINFO_TABLE + " WHERE id = '" + id + "' AND pw = '" + pw + "'";
		int result = 0;

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(LOGIN_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				result = 0;
			}else {
				result = 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return result;
	}



	/*카드사 등록*/
	public int insertCompanyDAO(CompanyInfoDTO dto) {
		final String INSERT_COMPANY_SQL = "INSERT INTO " + COMPANYINFO_TALBE + (" (name, tel) VALUES (?,?)");
		int result = 0;

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSERT_COMPANY_SQL)){
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTel());
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/*전체카드사 출력*/
	public ArrayList<CompanyInfoDTO> getCompanyList(){
		ArrayList<CompanyInfoDTO> list = new ArrayList<>();
		final String GET_COMPANYINFO_SQL = "SELECT * FROM " + COMPANYINFO_TALBE;

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_COMPANYINFO_SQL);
				ResultSet rs = pstmt.executeQuery()){
			while(rs.next()) {
				CompanyInfoDTO dto = new CompanyInfoDTO();
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				list.add(dto);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}


	/*모든 카테고리 리스트 (소분류는 해당 메소드에서 파싱)*/
	public ArrayList<CategoryDTO> getCategoryList(){
		ArrayList<CategoryDTO> list = new ArrayList<>();
		final String GET_ALLCATEGORY_SQL = "SELECT * FROM " + LARGECATEGORY_TABLE + " INNER JOIN " + SMALLCATEGORY_TABLE + " on " 
				+ LARGECATEGORY_TABLE + ".B_Category = " + SMALLCATEGORY_TABLE + ".B_Category ORDER BY s_name ASC";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_ALLCATEGORY_SQL);
				ResultSet rs = pstmt.executeQuery()){
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setB_category(rs.getInt("B_category"));
				dto.setB_name(rs.getString("B_name"));
				dto.setS_category(rs.getInt("S_category"));
				dto.setS_name(rs.getString("S_name"));
				list.add(dto);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/*대분류 카테고리 리스트*/
	public ArrayList<CategoryDTO> getLargeCategoryList(){
		ArrayList<CategoryDTO> list = new ArrayList<>();
		final String GET_LARGECATEGORY_SQL = "SELECT * FROM " + LARGECATEGORY_TABLE;

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_LARGECATEGORY_SQL);
				ResultSet rs = pstmt.executeQuery()){
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setB_category(rs.getInt("B_category"));
				dto.setB_name(rs.getString("B_name"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/* 대분류 추가 */
	public int insertLargeCategory(String B_name) {
		int result = 0;
		final String INSERT_LARGECATEGORY_SQL = "INSERT INTO " + LARGECATEGORY_TABLE + " (B_name) VALUES (?)";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSERT_LARGECATEGORY_SQL)){
			pstmt.setString(1, B_name);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 소분류 추가 */
	public int insertSmallCategory(int b_category, String s_name) {
		int result = 0;
		final String INSERT_SMALLCATEGORY_SQL = "INSERT INTO " + SMALLCATEGORY_TABLE + " (s_name, b_category) VALUES (?,?)";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSERT_SMALLCATEGORY_SQL)){
			pstmt.setString(1, s_name);
			pstmt.setInt(2, b_category);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 상담사회원가입 */
	public void insertCounseller(CounsellerInfoDTO dto) {
		final String INSERT_COUNSELLER_SQL = "INSERT INTO " + COUNSELLERINFO_TABLE + " (id, pw, name, company, tel, email , corporate) VALUES (?,?,?,?,?,?,?)";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSERT_COUNSELLER_SQL)){
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getCompany());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getCorporate());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	/* 상담사 모든 정보 get */
	public CounsellerInfoDTO getCounsellerInfo(String id) {
		final String GET_CONUSELLER_SQL = "SELECT * FROM " + COUNSELLERINFO_TABLE + " WHERE id = ?";
		CounsellerInfoDTO dto = new CounsellerInfoDTO();
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_CONUSELLER_SQL)){
			pstmt.setString(1, id);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()){
					dto.setId(id);
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setTel(rs.getString("tel"));
					dto.setEmail(rs.getString("email"));
					dto.setCorporate(rs.getString("corporate"));
					dto.setDivision(rs.getString("division"));
					System.out.println(rs.getString("division"));
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	public void insertAnswer(int num, String contents) {
		final String INSERT_ANSWER_SQL = "INSERT INTO " + DIRECTANSWER_TABLE + " (num, answer) VALUES (?, ?)";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSERT_ANSWER_SQL)){
			pstmt.setInt(1, num);
			pstmt.setString(2, contents);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int checkAnswer(int num) {
		final String UPDATE_CHECK_SQL = "UPDATE " + DIRECTINQIRY_TABLE + " SET answercheck=? WHERE num = " + num;
		int result = 0;
		System.out.println("check answer DAO num : " + num);
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(UPDATE_CHECK_SQL)) {
			pstmt.setInt(1, 1);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}


	/* 회원 테이블 총 레코드 수 */
	public int cntOfMemberList() {
		int cnt = 0;
		final String COUNT_LIST_SQL = "SELECT COUNT(*) FROM " + MEMBERINFO_TABLE;   
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_LIST_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}       
		return cnt;
	}

	/* 회원수 총 페이지수 계산 */
	public int calMemberTotalPage() {
		int numberOfArticles = cntOfMemberList();
		int totalPage = numberOfArticles / sizeOfMemberPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfMemberPage == 0 ? totalPage-1 : totalPage;

		return totalPage;
	}


	/* 1:1문의 리스트 */
	public ArrayList<MemberInfoDTO> getMemberList(int curPage) {
		final String GET_DIRECT_SQL = "SELECT * FROM " + MEMBERINFO_TABLE + " ORDER BY RegisterDay ASC LIMIT ?,?";
		ArrayList<MemberInfoDTO> list = new ArrayList<>();
		ResultSet rs = null;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_DIRECT_SQL)
				){
			pstmt.setInt(1, curPage*sizeOfMemberPage);
			pstmt.setInt(2, sizeOfMemberPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberInfoDTO dto = new MemberInfoDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setRegNum(rs.getString("regNum"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setEmail(rs.getString("email"));
				dto.setRegisterDay(rs.getString("registerDay"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public int insertCardInfo(CardInfoDTO dto) {
		final String INSER_CARDINFO_SQL = "INSERT INTO " + CARDINFO_TABLE + "(img, name, startAge, company, fee, outfee, record, reword, endAge) VALUES (?,?,?,?,?,?,?,?,?)";
		int result = 0;

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSER_CARDINFO_SQL)){
			pstmt.setString(1, dto.getImg());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getStartAge());
			pstmt.setString(4, dto.getCompany());
			pstmt.setString(5, dto.getFee());
			pstmt.setString(6, dto.getOutfee());
			pstmt.setString(7, dto.getRecord());
			pstmt.setString(8, dto.getReword());
			pstmt.setInt(9, dto.getEndAge());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;		
	}

	/* 카드 테이블 총 레코드 수 */
	public int cntOfCardList() {
		int cnt = 0;
		final String COUNT_LIST_SQL = "SELECT COUNT(*) FROM " + CARDINFO_TABLE;   
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_LIST_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}       
		return cnt;
	}

	/* 카드리스트 총 페이지 */
	public int calCardTotalPage() {
		int numberOfArticles = cntOfCardList();
		int totalPage = numberOfArticles / sizeOfCardPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfCardPage == 0 ? totalPage-1 : totalPage;

		return totalPage;
	}

	/* 카드리스트 */
	public ArrayList<CardInfoDTO> getCardList(int curPage) {
		final String GET_CARDINFO_SQL = "SELECT * FROM " + CARDINFO_TABLE + " ORDER BY RegisterDay ASC LIMIT ?,?";
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		ResultSet rs = null;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_CARDINFO_SQL)
				){
			pstmt.setInt(1, curPage*sizeOfCardPage);
			pstmt.setInt(2, sizeOfCardPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CardInfoDTO dto = new CardInfoDTO();
				dto.setImg(rs.getString("img"));
				dto.setName(rs.getString("name"));
				dto.setStartAge(rs.getInt("startAge"));
				dto.setCompany(rs.getString("company"));
				dto.setFee(rs.getString("fee"));
				dto.setOutfee(rs.getString("outfee"));
				dto.setRecord(rs.getString("record"));
				dto.setReword(rs.getString("reword"));
				dto.setSearchCnt(rs.getInt("searchCnt"));
				dto.setRegisterDay(rs.getString("registerDay"));
				dto.setIssuanceNum(rs.getInt("issuanceNum"));
				dto.setEndAge(rs.getInt("endAge"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	/* 공지 테이블 총 레코드 수 */
	public int cntOfNoticeList() {
		int cnt = 0;
		final String COUNT_LIST_SQL = "SELECT COUNT(*) FROM " + NOTICE_TABLE;   
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_LIST_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}       
		return cnt;
	}

	/* 공지리스트 총 페이지 */
	public int calNoticeTotalPage() {
		int numberOfArticles = cntOfNoticeList();
		int totalPage = numberOfArticles / sizeOfNoticePage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfNoticePage == 0 ? totalPage-1 : totalPage;

		return totalPage;
	}

	/* 공지리스트 */
	public ArrayList<NoticeDTO> getNoticeList(int curPage) {
		final String GET_NOTICE_SQL = "SELECT * FROM " + NOTICE_TABLE + " ORDER BY emphasis DESC, num DESC LIMIT ?,?";
		ArrayList<NoticeDTO> list = new ArrayList<>();
		ResultSet rs = null;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_NOTICE_SQL)
				){
			pstmt.setInt(1, curPage*sizeOfNoticePage);
			pstmt.setInt(2, sizeOfNoticePage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setWtime(rs.getString("wtime"));
				dto.setEmphasis(rs.getInt("emphasis"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}



	/* 회원 삭제 */
	public int deleteUserInfo(String userID) {
		int result = 0;
		final String DELETE_USER_SQL = "DELETE FROM " + MEMBERINFO_TABLE + " WHERE id = ?";
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(DELETE_USER_SQL)) {
			pstmt.setString(1, userID);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	/* 카드 삭제 */
	public int deleteCardInfo(String cardName) {
		int result = 0;
		final String DELETE_USER_SQL = "DELETE FROM " + CARDINFO_TABLE + " WHERE name = ?";
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(DELETE_USER_SQL)) {
			pstmt.setString(1, cardName);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	/* 공지사항 내용 출력*/
	public NoticeDTO getNoticeContents(int num) {
		System.out.println(num);
		final String GET_NOTICECONTENTS_SQL = "SELECT * FROM " + NOTICE_TABLE + " WHERE num = ?";
		NoticeDTO dto = new NoticeDTO();

		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_NOTICECONTENTS_SQL)) {
			pstmt.setInt(1, num);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setContents(rs.getString("contents"));
					dto.setWtime(rs.getString("wtime"));
					dto.setEmphasis(rs.getInt("emphasis"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	/* 공지사항 등록 */
	public int insertNotice(NoticeDTO dto) {
		int result = 0;
		final String INSERT_NOTICE_SQL = "INSERT INTO " + NOTICE_TABLE + " (title, contents, emphasis) VALUES (?,?,?)";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSERT_NOTICE_SQL)){
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContents());
			pstmt.setInt(3, dto.getEmphasis());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	/* 공지사항 삭제 */
	public int deleteNoticeInfo(int num) {
		int result = 0;
		final String DELETE_NOTICE_SQL = "DELETE FROM " + NOTICE_TABLE + " WHERE num = ?";
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(DELETE_NOTICE_SQL)) {
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	/* 답변 get*/
	public DirectDTO getAnswer(int num) {
		DirectDTO dto = new DirectDTO();
		final String GET_ANSWER_SQL = "SELECT * FROM " +DIRECTANSWER_TABLE + " WHERE num =" + num; 

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_ANSWER_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setAnswer(rs.getString("answer"));
				dto.setAnswertime(rs.getString("answertime"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}


	/* 상담사 테이블 총 레코드 수 */
	public int cntOfCounsellerList() {
		int cnt = 0;
		final String COUNT_LIST_SQL = "SELECT COUNT(*) FROM " + COUNSELLERINFO_TABLE;   
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_LIST_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}       
		return cnt;
	}

	/* 상담사 총 페이지 */
	public int calCounsellerTotalPage() {
		int numberOfArticles = cntOfCounsellerList();
		int totalPage = numberOfArticles / sizeOfCounsellePage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfCounsellePage == 0 ? totalPage-1 : totalPage;

		return totalPage;
	}

	/* 상담사 리스트 */
	public ArrayList<CounsellerInfoDTO> getCounsellerList(int curPage) {
		final String GET_COUNSELLER_SQL = "SELECT * FROM " + COUNSELLERINFO_TABLE + " ORDER BY registerDay DESC LIMIT ?,?";
		ArrayList<CounsellerInfoDTO> list = new ArrayList<>();
		ResultSet rs = null;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_COUNSELLER_SQL)){
			pstmt.setInt(1, curPage*sizeOfCounsellePage);
			pstmt.setInt(2, sizeOfCounsellePage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CounsellerInfoDTO dto = new CounsellerInfoDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setCompany(rs.getString("company"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setCorporate(rs.getString("corporate"));
				dto.setDivision(rs.getString("division"));
				dto.setRegisterDay(rs.getString("registerDay"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	//카드찾기 기능
	//answer3번과 answer7번 or로 
	//answer4번과 answer8번 or로
	public ArrayList<CardInfoDTO> searchCardList(String[] e){
		int startAge = Integer.parseInt(e[0].substring(0,2));    //answer1
		int endAge = Integer.parseInt(e[0].substring(3,5));      //answer1
		String reword1 = e[1];    //answer2
		String reword2 = e[2];    //answer3
		int fee = Integer.parseInt(e[3]);       //answer4
		String reword3 = e[4];    //answer5
		String reword4 = e[5];    //answer6
		String reword5 = e[6];    //answer7
		String reword6 = e[7];    //answer8

		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String SEARCH_CARD_SQL = "SELECT * FROM " + CARDINFO_TABLE 
				+ " WHERE startAge >= ? AND endAge <= ? AND fee <= ? AND (reword LIKE ? AND (reword LIKE ? OR reword LIKE ?) OR (reword LIKE ? OR reword LIKE ?) OR reword LIKE ?)";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SEARCH_CARD_SQL)){
			pstmt.setInt(1, startAge);
			pstmt.setInt(2, endAge);
			pstmt.setInt(3, fee);
			pstmt.setString(4, "%" + reword1 + "%");
			pstmt.setString(5, "%" + reword2 + "%");
			pstmt.setString(6, "%" + reword5 + "%");
			pstmt.setString(7, "%" + reword3 + "%");
			pstmt.setString(8, "%" + reword6 + "%");
			pstmt.setString(9, "%" + reword4 + "%");

			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setStartAge(rs.getInt("startAge"));
					dto.setEndAge(rs.getInt("endAge"));
					dto.setCompany(rs.getString("company"));
					dto.setFee(rs.getString("fee"));
					dto.setRecord(rs.getString("record"));
					dto.setReword(rs.getString("reword"));
					dto.setSearchCnt(rs.getInt("searchCnt"));
					dto.setOutfee(rs.getString("outfee"));
					dto.setRegisterDay(rs.getString("registerDay"));
					dto.setIssuanceNum(rs.getInt("issuanceNum"));
					countSearchByCardCompany(rs.getString("name"));
					list.add(dto);
				}
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		}

		return list;
	}

	public CardInfoDTO getCardInfo(String cardName) {
		CardInfoDTO dto = new CardInfoDTO();

		final String GET_CARDINFO_SQL = "SELECT * FROM " + CARDINFO_TABLE + " WHERE name = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_CARDINFO_SQL)){
			pstmt.setString(1, cardName);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setStartAge(rs.getInt("startAge"));
					dto.setEndAge(rs.getInt("endAge"));
					dto.setCompany(rs.getString("company"));
					dto.setFee(rs.getString("fee"));
					dto.setRecord(rs.getString("record"));
					dto.setReword(rs.getString("reword"));
					dto.setSearchCnt(rs.getInt("searchCnt"));
					dto.setOutfee(rs.getString("outfee"));
					dto.setRegisterDay(rs.getString("registerDay"));
					dto.setIssuanceNum(rs.getInt("issuanceNum"));
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	public int insertIssuanceCard(IssuanceDTO dto) {
		int result = 0;
		final String INSERT_ISSUANCE_SQL = "INSERT INTO " + ISSUANCE_TABLE + " (cardName, userName, userId, phone, address, email, contactableDate, startTime, endTime, cardCompany) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSERT_ISSUANCE_SQL)){
			pstmt.setString(1, dto.getCardName());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getUserId());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getContactableDate());
			pstmt.setString(8, dto.getStartTime());
			pstmt.setString(9, dto.getEndTime());
			pstmt.setString(10, dto.getCardCompany());
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return result; 
	}

	/* 카드 테이블 총 레코드 수 */
	public int cntOfIssuanceList() {
		int cnt = 0;
		final String COUNT_LIST_SQL = "SELECT COUNT(*) FROM " + ISSUANCE_TABLE;   
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_LIST_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}       
		return cnt;
	}

	/* 카드리스트 총 페이지 */
	public int calIssuanceTotalPage() {
		int numberOfArticles = cntOfIssuanceList();
		int totalPage = numberOfArticles / sizeOfIssuancePage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfIssuancePage == 0 ? totalPage-1 : totalPage;

		return totalPage;
	}

	/* 발급리스트 */
	public ArrayList<IssuanceDTO> getIssuanceList(int curPage,int issCondition) {
		final String GET_ISSUANCELIST_SQL = "SELECT * FROM " + ISSUANCE_TABLE + " WHERE issCondition = ? ORDER BY num ASC LIMIT ?,?";
		ArrayList<IssuanceDTO> list = new ArrayList<>();
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_ISSUANCELIST_SQL)
				){
			pstmt.setInt(1, issCondition);
			pstmt.setInt(2, curPage*sizeOfIssuancePage);
			pstmt.setInt(3, sizeOfIssuancePage);
			try(ResultSet rs = pstmt.executeQuery()){

				while(rs.next()) {
					IssuanceDTO dto = new IssuanceDTO();
					dto.setNum(rs.getInt("num"));
					dto.setCardName(rs.getString("cardName"));
					dto.setUserId(rs.getString("userId"));
					dto.setIssCondition(rs.getInt("issCondition"));
					dto.setContactableDate(rs.getString("contactableDate"));
					dto.setStartTime(rs.getString("startTime"));
					dto.setEndTime(rs.getString("endTime"));
					dto.setAddress(rs.getString("address"));
					dto.setUserName(rs.getString("userName"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setRequestDate(rs.getString("requestDate"));
					dto.setIssuanceDate(rs.getString("issuanceDate"));
					dto.setCounseller(rs.getString("counseller"));
					dto.setCardCompany(rs.getString("cardCompany"));
					list.add(dto);
				}
			} 
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/* 발급정보 삭제 */
	public int deleteIssuanceInfo(int num) {
		final String DELETE_ISSUANCE_SQL = "DELETE FROM " + ISSUANCE_TABLE + " WHERE num = ?";
		int result = 0;

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(DELETE_ISSUANCE_SQL)){
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 사업자별 발급상태를 변수로 한 발급리스트 수 */
	public int countCounsellerIssuance(int issCoundition, String counsellerName) {
		int cnt = 0;
		final String COUNT_ISSUANCE_SQL = "SELECT COUNT(*) FROM " + ISSUANCE_TABLE + " WHERE issCondition = ? AND counseller = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_ISSUANCE_SQL)){
			pstmt.setInt(1, issCoundition);
			pstmt.setString(2, counsellerName);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					cnt = rs.getInt(1);
				}
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}

	/* 발급상태별 총 테이블 수 */
	public int countIssuance(int issCoundition) {
		int cnt = 0;
		final String COUNT_ISSUANCE_SQL = "SELECT COUNT(*) FROM " + ISSUANCE_TABLE + " WHERE issCondition = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_ISSUANCE_SQL)){
			pstmt.setInt(1, issCoundition);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					cnt = rs.getInt(1);
				}
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}
	
	/* 회사 상담사 발급상태를 변수로 한 발급리스트 수 */
	public int countCompanyIssuance(int issCoundition, String cardCompany, String counsellerName) {
		int cnt = 0;
		final String COUNT_ISSUANCE_SQL = "SELECT COUNT(*) FROM " + ISSUANCE_TABLE + " WHERE issCondition = ? AND cardCompany = ? AND counseller = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_ISSUANCE_SQL)){
			pstmt.setInt(1, issCoundition);
			pstmt.setString(2, cardCompany);
			pstmt.setString(3, counsellerName);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					cnt = rs.getInt(1);
				}
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}
	
	/* 회사별 발급상태에 따른 카드 수 */
	public int countCompanyIssuance(int issCondition, String company) {
		int cnt = 0;
		final String COUNT_ISSUANCE_SQL = "SELECT COUNT(*) FROM " + ISSUANCE_TABLE + " WHERE issCondition = ? AND company = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_ISSUANCE_SQL)){
			pstmt.setInt(1, issCondition);
			pstmt.setString(2, company);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					cnt = rs.getInt(1);
				}
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}
	
	/* 회원별 발급정보 */
	//issCondition=0 발급대기, =1발급중, =2발급완료
	public ArrayList<UserIssuanceDTO> getUserIssuance(String userId, int issCondition){
		ArrayList<UserIssuanceDTO> list = new ArrayList<>();
		final String GET_USERISSUANCE_SQL = "SELECT * from " + ISSUANCE_TABLE + " INNER JOIN " + CARDINFO_TABLE + " ON issuance.cardName = cardinfo.name WHERE userId = ? AND issCondition = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_USERISSUANCE_SQL)){
			pstmt.setString(1, userId);
			pstmt.setInt(2, issCondition);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					UserIssuanceDTO dto = new UserIssuanceDTO();
					dto.setAddress(GET_USERISSUANCE_SQL);
					dto.setNum(rs.getInt("num"));
					dto.setCardName(rs.getString("cardName"));
					dto.setUserId(rs.getString("userId"));
					dto.setIssCondition(rs.getInt("issCondition"));
					dto.setContactableDate(rs.getString("contactableDate"));
					dto.setStartTime(rs.getString("startTime"));
					dto.setEndTime(rs.getString("endTime"));
					dto.setAddress(rs.getString("address"));
					dto.setUserName(rs.getString("userName"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setRequestDate(rs.getString("requestDate"));
					dto.setIssuanceDate(rs.getString("issuanceDate"));
					dto.setCounseller(rs.getString("counseller"));
					dto.setImg(rs.getString("img"));
					dto.setCompany(rs.getString("company"));
					list.add(dto);
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	/* 회원별 발급정보 */
	//issCondition=0 발급대기, =1발급중, =2발급완료
	public ArrayList<UserIssuanceDTO> getUserIssuance(String userId){
		ArrayList<UserIssuanceDTO> list = new ArrayList<>();
		final String GET_USERISSUANCE_SQL = "SELECT * from " + ISSUANCE_TABLE + " INNER JOIN " + CARDINFO_TABLE + " ON issuance.cardName = cardinfo.name WHERE userId = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_USERISSUANCE_SQL)){
			pstmt.setString(1, userId);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					UserIssuanceDTO dto = new UserIssuanceDTO();
					dto.setAddress(GET_USERISSUANCE_SQL);
					dto.setNum(rs.getInt("num"));
					dto.setCardName(rs.getString("cardName"));
					dto.setUserId(rs.getString("userId"));
					dto.setIssCondition(rs.getInt("issCondition"));
					dto.setContactableDate(rs.getString("contactableDate"));
					dto.setStartTime(rs.getString("startTime"));
					dto.setEndTime(rs.getString("endTime"));
					dto.setAddress(rs.getString("address"));
					dto.setUserName(rs.getString("userName"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setRequestDate(rs.getString("requestDate"));
					dto.setIssuanceDate(rs.getString("issuanceDate"));
					dto.setCounseller(rs.getString("counseller"));
					dto.setImg(rs.getString("img"));
					dto.setCompany(rs.getString("company"));
					list.add(dto);
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	/* 카드사별 발급정보 */
	//issCondition=0 발급대기, =1발급중, =2발급완료
	public ArrayList<UserIssuanceDTO> getCompnayIssuance(String company, int issCondition){
		ArrayList<UserIssuanceDTO> list = new ArrayList<>();
		final String GET_USERISSUANCE_SQL = "SELECT * from " + ISSUANCE_TABLE + " INNER JOIN " + CARDINFO_TABLE + " ON issuance.cardName = cardinfo.name WHERE cardCompany = ? AND issCondition = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_USERISSUANCE_SQL)){
			pstmt.setString(1, company);
			pstmt.setInt(2, issCondition);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					UserIssuanceDTO dto = new UserIssuanceDTO();
					dto.setAddress(rs.getString("address"));
					dto.setNum(rs.getInt("num"));
					dto.setCardName(rs.getString("cardName"));
					dto.setUserId(rs.getString("userId"));
					dto.setIssCondition(rs.getInt("issCondition"));
					dto.setContactableDate(rs.getString("contactableDate"));
					dto.setStartTime(rs.getString("startTime"));
					dto.setEndTime(rs.getString("endTime"));
					dto.setAddress(rs.getString("address"));
					dto.setUserName(rs.getString("userName"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setRequestDate(rs.getString("requestDate"));
					dto.setIssuanceDate(rs.getString("issuanceDate"));
					dto.setCounseller(rs.getString("counseller"));
					dto.setImg(rs.getString("img"));
					dto.setCompany(rs.getString("cardCompany"));
					list.add(dto);
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	/*상담사 별 발급정보 */
	public int countCounsellerIssuance(String conusellerName) {
		int cnt = 0;
		final String COUNT_ISSUANCE_SQL = "SELECT COUNT(*) FROM " + ISSUANCE_TABLE + " WHERE counseller = ?";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_ISSUANCE_SQL)){
			pstmt.setString(1, conusellerName);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					cnt = rs.getInt(1);
				}
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}
	
	/* 상담사가 발급버튼 클릭시 issCondition 값이 1(발급중)로 변환*/
	public int changeissCondition1(int num, String counsellerName) {
		int result = 0;
		final String CHANGE_ISSCONDITION_SQL = "UPDATE " + ISSUANCE_TABLE + " SET issCondition=1, counseller = ? WHERE num = ?";
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(CHANGE_ISSCONDITION_SQL)){
			pstmt.setString(1, counsellerName);
			pstmt.setInt(2, num);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result; 
	}
	
	/* 상담사별 진행중인 발급정보 */
	public ArrayList<UserIssuanceDTO> counsellerIssuancingCommand(String counsellerName, int issCondition){
		ArrayList<UserIssuanceDTO> list = new ArrayList<>();
		final String COU_ISSUANCING_SQL = "SELECT * FROM " + ISSUANCE_TABLE + " INNER JOIN cardInfo ON issuance.cardName = cardinfo.name where issCondition = ? and counseller = ?";
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COU_ISSUANCING_SQL)){
			pstmt.setInt(1, issCondition);
			pstmt.setString(2, counsellerName);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					UserIssuanceDTO dto = new UserIssuanceDTO();
					dto.setAddress(rs.getString("address"));
					dto.setNum(rs.getInt("num"));
					dto.setCardName(rs.getString("cardName"));
					dto.setUserId(rs.getString("userId"));
					dto.setIssCondition(rs.getInt("issCondition"));
					dto.setContactableDate(rs.getString("contactableDate"));
					dto.setStartTime(rs.getString("startTime"));
					dto.setEndTime(rs.getString("endTime"));
					dto.setAddress(rs.getString("address"));
					dto.setUserName(rs.getString("userName"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setRequestDate(rs.getString("requestDate"));
					dto.setIssuanceDate(rs.getString("issuanceDate"));
					dto.setCounseller(rs.getString("counseller"));
					dto.setImg(rs.getString("img"));
					dto.setCompany(rs.getString("cardCompany"));
					list.add(dto);
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/* 상담사가 발급완료 클릭시 issCondition 값이 2(발급완료)로 변환*/
	public int changeissCondition2(int num) {
		int result = 0;
		final String CHANGE_ISSCONDITION_SQL = "UPDATE " + ISSUANCE_TABLE + " SET issCondition = 2, issuanceDate = ? WHERE num = ?";
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(CHANGE_ISSCONDITION_SQL)){
	        pstmt.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now(ZoneId.of("Asia/Seoul"))));
			pstmt.setInt(2, num);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result; 
	}
	
	/* 발급 완료시 발급횟수 증가*/
	public void incrementissuanceNum(String cardName) {
		final String INCRE_ISSNUM_SLQ = "UPDATE " + CARDINFO_TABLE + " SET issuanceNum = issuanceNum + 1 WHERE name = ? ";
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INCRE_ISSNUM_SLQ)){
			pstmt.setString(1, cardName);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	/* 회사명 검색하면 갯수 반환 */
	public int countSearchByCardCompany(String keyword) {
		final String COUNT_RESULT_SQL = "SELECT COUNT(*) FROM " + CARDINFO_TABLE + " WHERE company LIKE ? ";
		int cnt = 0;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_RESULT_SQL)){
			pstmt.setString(1, "%" + keyword + "%");
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					cnt=rs.getInt(1);
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	
	/* 회원별 발급 완료된 카드 수*/
	public int countIssuanceOfMember(String userId) {
		int cnt = 0;
		final String COUNT_ISSUANCE_SQL = "SELECT COUNT(*) FROM " + ISSUANCE_TABLE + " WHERE issCondition = 2 AND userId = ?";
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(COUNT_ISSUANCE_SQL)){
			pstmt.setString(1, userId);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					cnt = rs.getInt(1);
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	/* 카드 종류별 랭킹리스트 */
	public ArrayList<CardInfoDTO> getCardRankingList(int curPage, String cardDivision){
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String GET_RANKING_SQL = "SELECT img, name,company,cardDivision FROM " + CARDINFO_TABLE + " WHERE cardDivision = ? ORDER BY searchCnt DESC LIMIT ?,?";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_RANKING_SQL)){
				pstmt.setString(1, cardDivision);
				pstmt.setInt(2, curPage * sizeOfRankingList);
				pstmt.setInt(3, sizeOfRankingList);
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setCardDivision(rs.getString("cardDivision"));
					list.add(dto);
					}
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	/* 발급횟수 랭킹리스트 */
	public ArrayList<CardInfoDTO> getCardissRankingList(int curPage){
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String GET_RANKING_SQL = "SELECT img, name,company,cardDivision FROM " + CARDINFO_TABLE + " ORDER BY issuanceNum DESC LIMIT ?,?";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_RANKING_SQL)){
				pstmt.setInt(1, curPage * sizeOfRankingList);
				pstmt.setInt(2, sizeOfRankingList);
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setCardDivision(rs.getString("cardDivision"));
					list.add(dto);
					}
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/* 회사별 랭킹리스트 */
	public ArrayList<CardInfoDTO> getCardCompanyRankingList(int curPage, String company){
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String GET_RANKING_SQL = "SELECT img, name,company,cardDivision FROM " + CARDINFO_TABLE + " WHERE company = ? ORDER BY searchCnt DESC LIMIT ?,?";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_RANKING_SQL)){
				pstmt.setString(1, company);
				pstmt.setInt(2, curPage * sizeOfRankingList);
				pstmt.setInt(3, sizeOfRankingList);
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setCardDivision(rs.getString("cardDivision"));
					list.add(dto);
					}
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/* 혜택별 랭킹리스트 */
	public ArrayList<CardInfoDTO> getCardRewordRankingList(int curPage, String reword){
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String GET_RANKING_SQL = "SELECT img, name,company,cardDivision FROM " + CARDINFO_TABLE + " WHERE reword LIKE ? ORDER BY searchCnt DESC LIMIT ?,?";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_RANKING_SQL)){
				pstmt.setString(1, "%" + reword + "%");
				pstmt.setInt(2, curPage * sizeOfRankingList);
				pstmt.setInt(3, sizeOfRankingList);
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setCardDivision(rs.getString("cardDivision"));
					list.add(dto);
					}
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/* 연회비 1원 이상 랭킹리스트 */
	public ArrayList<CardInfoDTO> getCardFeeRankingList(int curPage, int fee){
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String GET_RANKING_SQL = "SELECT img, name,company,cardDivision FROM " + CARDINFO_TABLE + " WHERE fee >= ? ORDER BY searchCnt DESC LIMIT ?,?";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_RANKING_SQL)){
				pstmt.setInt(1, fee);
				pstmt.setInt(2, curPage * sizeOfRankingList);
				pstmt.setInt(3, sizeOfRankingList);
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setCardDivision(rs.getString("cardDivision"));
					list.add(dto);
					}
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/* 연회비 무료 랭킹리스트 overriding */
	public ArrayList<CardInfoDTO> getCardFeeRankingList(int curPage){
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String GET_RANKING_SQL = "SELECT img, name,company,cardDivision FROM " + CARDINFO_TABLE + " WHERE fee = 0 ORDER BY searchCnt DESC LIMIT ?,?";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_RANKING_SQL)){
				pstmt.setInt(1, curPage * sizeOfRankingList);
				pstmt.setInt(2, sizeOfRankingList);
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setCardDivision(rs.getString("cardDivision"));
					list.add(dto);
					}
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/* 실적 1원 이상 랭킹리스트 */
	public ArrayList<CardInfoDTO> getCardRecordRankingList(int curPage, int record){
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String GET_RANKING_SQL = "SELECT img, name,company,cardDivision FROM " + CARDINFO_TABLE + " WHERE record >= ? ORDER BY searchCnt DESC LIMIT ?,?";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_RANKING_SQL)){
				pstmt.setInt(1, record);
				pstmt.setInt(2, curPage * sizeOfRankingList);
				pstmt.setInt(3, sizeOfRankingList);
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setCardDivision(rs.getString("cardDivision"));
					list.add(dto);
					}
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/* 연회비 무료 랭킹리스트 overriding */
	public ArrayList<CardInfoDTO> getCardRecordRankingList(int curPage){
		ArrayList<CardInfoDTO> list = new ArrayList<>();
		final String GET_RANKING_SQL = "SELECT img, name,company,cardDivision FROM " + CARDINFO_TABLE + " WHERE record = 0 ORDER BY searchCnt DESC LIMIT ?,?";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_RANKING_SQL)){
				pstmt.setInt(1, curPage * sizeOfRankingList);
				pstmt.setInt(2, sizeOfRankingList);
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
					CardInfoDTO dto = new CardInfoDTO();
					dto.setImg(rs.getString("img"));
					dto.setName(rs.getString("name"));
					dto.setCompany(rs.getString("company"));
					dto.setCardDivision(rs.getString("cardDivision"));
					list.add(dto);
					}
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/* 상담사 회원탈퇴 */
	public int deleteCounsellerInfo(String id) {
		final String DELETE_INFO_SQL = "DELETE FROM " + COUNSELLERINFO_TABLE + " WHERE id = ?";
		int result = 0;
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(DELETE_INFO_SQL)){
			pstmt.setString(1, id);
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	

}
