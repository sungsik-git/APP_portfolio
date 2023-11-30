package com.cardfit.www.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.www.DTO.CounsellerInfoDTO;
import com.cardfit.www.DTO.DirectDTO;
import com.cardfit.www.DTO.MemberInfoDTO;

public class MemberInfoDAO {
	private static MemberInfoDAO memberDAO = new MemberInfoDAO();
	private final String CONNECTION_POOL_RESOURCE = "jdbc/cardfit";
	private final String MEMBERINFO_TABLE = "MemberInfo";
	private final String DIRECTINQIRY_TABLE = "DirectInqiry";
	private final String DIRECTANSWER_TABLE = "DirectAnswer";
	private final String COUNSELLERINFO_TABLE = "CounsellerInfo";
	private final String CARDINFO_TABLE = "cardInfo";
	
	private int sizeOfPage = 10;
	
	private DataSource dataSource;
	
	private MemberInfoDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static MemberInfoDAO getMemberDAO() {
		return memberDAO;
	}
	
	/* 회원가입 DAO*/
	public int memberRegisterDAO(MemberInfoDTO dto) {
		final String REGISTER_SQL = "INSERT INTO " + MEMBERINFO_TABLE + " (id, pw, name, regNum, phone, address, email) VALUES (?,?,?,?,?,?,?)";
		int result = 0;
		
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(REGISTER_SQL)){
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getRegNum());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getAddress());
			pstmt.setString(7, dto.getEmail());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* ID 중복확인 DAO */
	public int checkId(String id) {
		String sql = "SELECT * FROM " + MEMBERINFO_TABLE + " WHERE ID = '" + id +"'";
		int result = 0;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			if(rs.next()) result = 0;
			else result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 회원 로그인 DAO */
	public int login(String id, String pw) {
		final String LOGIN_SQL = "SELECT id, pw FROM " + MEMBERINFO_TABLE + " WHERE id = '" + id + "' AND pw = '" + pw + "'";
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
	
	/* 모든 회원정보 get*/
	public MemberInfoDTO getMemberInfo(String id) {
		MemberInfoDTO dto = new MemberInfoDTO();
		final String GET_SQL = "SELECT * FROM " + MEMBERINFO_TABLE + " WHERE id = '" + id + "'";
		
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_SQL);
				ResultSet rs = pstmt.executeQuery()){
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setRegNum(rs.getString("regNum"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setEmail(rs.getString("email"));
				dto.setDivision(rs.getString("division"));
				dto.setRegisterDay(rs.getString("registerDay"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/* 회원정보 수정 */
	public int modifyOK(MemberInfoDTO dto,String id) {
		final String UPDATE_SQL = "UPDATE " + MEMBERINFO_TABLE + " SET name=?, regNum=?, phone=?, address=?, email=? WHERE id ='" + id + "'";
		int result = 0; 
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(UPDATE_SQL)){
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getRegNum());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getEmail());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/* 아이디 비밀번호 찾기 */
	public MemberInfoDTO searchIDPW(String name, String regNum) {
		final String SEARCHIDPW_SQL = "SELECT * FROM " + MEMBERINFO_TABLE + " WHERE name='" + name + "' AND regNum='" + regNum + "'";
		MemberInfoDTO dto = new MemberInfoDTO();
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SEARCHIDPW_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	/* 비밀번호 변경 */
	public int changePW(MemberInfoDTO dto,String id) {
		int result = 0;
		final String CHANGEPW_SQL = "UPDATE " + MEMBERINFO_TABLE + " SET pw=? WHERE id='" + id + "'";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(CHANGEPW_SQL)){
			pstmt.setString(1, dto.getPw());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 메일발송시 이메일인증 */
	class MyAuthentication extends Authenticator {
	      
	    PasswordAuthentication pa;
	    public MyAuthentication(){
	         
	    	String id = "kss950708@naver.com";  //네이버 이메일 아이디
	        String pw = "1theo100@";        //네이버 비밀번호
	 
	        // ID와 비밀번호를 입력한다.
	        pa = new PasswordAuthentication(id, pw);
	    }
	 
	    // 시스템에서 사용하는 인증정보
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	
	}
	
	/* 회원가입 인증메일에 발송할 랜덤번호 */
	public int makeRandomNumber() {
	    	int randomNumber = (int) (Math.random()*899998)+100001;
	    	System.out.println(randomNumber);
	    	return randomNumber;
	}
	    
	    
	/* 회원가입 인증메일 발송 */
	public int sendMail_reRandNum(String userEmail) {
		int randNum = makeRandomNumber();
    	Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
        p.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 true 고정
        p.put("mail.smtp.port", "587");                 // 네이버 포트
        p.put("mail.smtp.port", "587");                 // 네이버 포트
           
        Authenticator auth = new MyAuthentication();
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress() ;
            from = new InternetAddress("kss950708@naver.com"); //발신자 아이디
            // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            InternetAddress to = new InternetAddress(userEmail);
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject("카드핏 회원가입 인증 이메일입니다.", "UTF-8");
            // 이메일 내용
            msg.setText("안녕하세요. 카드핏 회원가입 인증번호입니다. 아래 인증번호를 입력해주세요" + randNum + "", "UTF-8");
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg, msg.getAllRecipients());
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();

        }
        return randNum;
    }
	
	/* 1:1문의 등록 */
	public int insertHelpDirect(DirectDTO dto) {
		int result = 0;
		final String INSERT_DIRECT_SQL = "INSERT INTO " + DIRECTINQIRY_TABLE + " (title, category, contents, writer) VALUES (?,?,?,?)";
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INSERT_DIRECT_SQL)){
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getContents());
			pstmt.setString(4, dto.getWriter());
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 1:1문의 리스트 */
	public ArrayList<DirectDTO> getDirectInquiey(int curPage) {
		final String GET_DIRECT_SQL = "SELECT * FROM " + DIRECTINQIRY_TABLE + " ORDER BY num DESC LIMIT ?,?";
		ArrayList<DirectDTO> list = new ArrayList<>();
		ResultSet rs = null;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_DIRECT_SQL)
				){
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DirectDTO dto = new DirectDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setWtime(rs.getString("wtime"));
				dto.setAnswercheck(rs.getInt("answercheck"));
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
	
	/* 테이블 총 레코드 수 */
	public int cntOfList() {
	    int cnt = 0;
	    final String COUNT_LIST_SQL = "SELECT COUNT(*) FROM " + DIRECTINQIRY_TABLE;   
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

	/* 총 페이지수 계산 */
	public int calTotalPage() {
		int numberOfArticles = cntOfList();
		int totalPage = numberOfArticles / sizeOfPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	
	
	/* num을 매개변수로 받아 1:1문의 dto 반환*/
	public DirectDTO getDirectInqiry(int num) {
		DirectDTO dto = new DirectDTO();
		final String GET_INQIEY_SQL = "SELECT * FROM " + DIRECTINQIRY_TABLE + " WHERE num = " + num;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(GET_INQIEY_SQL);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setCategory(rs.getString("category"));
				dto.setWtime(rs.getString("wtime"));
				dto.setWriter(rs.getString("writer"));
				dto.setAnswercheck(rs.getInt("answercheck"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int deleteUserInfo(String id) {
		final String DELETE_INFO_SQL = "DELETE FROM " + MEMBERINFO_TABLE + " WHERE id = ?";
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
	
	/* 키워드를 매개변수로 카드이름 검색*/
	public ArrayList<CardInfoDTO> searchCardnameByKeyword(String keyword) {
	    ArrayList<CardInfoDTO> list = new ArrayList<>();
	    final String SEARCH_CARD_SQL = "SELECT * FROM " + CARDINFO_TABLE + " WHERE name LIKE ?";

	    try (Connection conn = dataSource.getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(SEARCH_CARD_SQL)) {
	        pstmt.setString(1, "%" + keyword + "%");
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
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
	                incrementCardByNameSearchCnt(keyword);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	/* 키워드를 매개변수로 카드혜택 검색*/
	public ArrayList<CardInfoDTO> searchCardrewordByKeyword(String keyword) {
	    ArrayList<CardInfoDTO> list = new ArrayList<>();
	    final String SEARCH_CARD_SQL = "SELECT * FROM " + CARDINFO_TABLE + " WHERE reword LIKE ?";

	    try (Connection conn = dataSource.getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(SEARCH_CARD_SQL)) {
	        pstmt.setString(1, "%" + keyword + "%");
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
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
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	/* 키워드를 매개변수로 회사 검색*/
	public ArrayList<CardInfoDTO> searchCardCompanyByKeyword(String keyword) {
	    ArrayList<CardInfoDTO> list = new ArrayList<>();
	    final String SEARCH_CARD_SQL = "SELECT * FROM " + CARDINFO_TABLE + " WHERE company LIKE ?";

	    try (Connection conn = dataSource.getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(SEARCH_CARD_SQL)) {
	        pstmt.setString(1, "%" + keyword + "%");
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
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
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public void incrementCardByNameSearchCnt(String keyword) {
		final String INCREMENT_SEARCHCNT_SQL = "UPDATE " + CARDINFO_TABLE + " SET searchCnt = searchCnt+1 WHERE name LIKE ?";
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(INCREMENT_SEARCHCNT_SQL)){
	        pstmt.setString(1, "%" + keyword + "%");
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public int countSearchByCardName(String keyword) {
		final String COUNT_RESULT_SQL = "SELECT COUNT(*) FROM " + CARDINFO_TABLE + " WHERE name LIKE ? ";
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
	
	public int countSearchByCardReword(String keyword) {
		final String COUNT_RESULT_SQL = "SELECT COUNT(*) FROM " + CARDINFO_TABLE + " WHERE reword LIKE ? ";
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
	
}
