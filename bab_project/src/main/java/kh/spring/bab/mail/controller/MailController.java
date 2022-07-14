package kh.spring.bab.mail.controller;



import java.io.File;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.bab.mail.domain.MailRcv;
import kh.spring.bab.mail.domain.MailSend;
import kh.spring.bab.mail.model.service.MailService;

@Controller
@RequestMapping("mail")
public class MailController {

	@Autowired
	private MailService service;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv
			) {
		mv.setViewName("mail/main");
		return mv;
	}
	
	@PostMapping("/selectRcv")
	public ModelAndView selectRcv(ModelAndView mv,
			@RequestParam(name="page", defaultValue = "1") int currentPage,
			@RequestParam(name="email", required = false) String email,
			MailRcv mailRcv
			) {
		
		final int pageSize = 5;
		final int pageBlock = 5;
		
		List<MailRcv> selectRcvMail = service.selectRcvMail(currentPage, pageSize, email);
		
		int totalCnt = service.selectRcvTotalCnt();
		
		// paging 처리
		int pageCnt = totalCnt / pageSize + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		// int endPage = pageBlock;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		mv.addObject("email", email);
		mv.addObject("selectRcv", selectRcvMail);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("mail/selectRcv");
		return mv;
	}
	
	@PostMapping("/selectSnd")
	public ModelAndView selectSnd(ModelAndView mv,
			@RequestParam(name="page", defaultValue = "1") int currentPage,
			@RequestParam(name="email", required = false) String email,
			MailSend mailSnd
			) {
		
		final int pageSize = 5;
		final int pageBlock = 5;
		
		List<MailSend> selectSndMail = service.selectSndMail(currentPage, pageSize, email);
		
		int totalCnt = service.selectRcvTotalCnt();
		
		// paging 처리
		int pageCnt = totalCnt / pageSize + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		// int endPage = pageBlock;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		mv.addObject("email", email);
		mv.addObject("selectSnd", selectSndMail);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
		
		mv.setViewName("mail/selectSnd");
		return mv;
	}
	
	
	@GetMapping("/read")
	public ModelAndView selectOne(ModelAndView mv,
			@RequestParam(name="mRcvNo", required = false) String mRcvNo,
			@RequestParam(name="mSndNo", required = false) String mSndNo
			
			) {
		int mailNo = 0;
		
		if(mRcvNo != null) {
			
			mailNo = Integer.parseInt(mRcvNo);
			mv.addObject("readMail", service.readRcvMail(mailNo));
			mv.setViewName("mail/selectOneRcv");
		} else {
			mailNo = Integer.parseInt(mSndNo);
			mv.addObject("readMail", service.readSndMail(mailNo));
			mv.setViewName("mail/selectOneSnd");
		}
		
		return mv;
	}
	
	@PostMapping(value="/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(HttpServletRequest request
			, RedirectAttributes rttr
			) {
		
		
		String[] send_no = request.getParameterValues("valueArrSnd");
		String[] rec_no = request.getParameterValues("valueArrRcv");
		System.out.println("mNo : " + send_no);
		System.out.println("mNo : " + rec_no);
		
		if(send_no != null) {
			int size = send_no.length;
			System.out.println("size : " + size);
			
			int result = 0;
			
			for(int i=0; i<size; i++) {
				result = service.deleteSndMail(send_no[i]);
				System.out.println("result : " + result);
			}
				String msg = "";
				if(result > 0) {
					msg = "게시글 삭제에 성공하였습니다.";
				} else {
					msg = "게시글 삭제에 실패하였습니다.";
				}
				return msg;
		} else {
			int size = rec_no.length;
			System.out.println("size : " + size);
			
			int result = 0;
			
			for(int i=0; i<size; i++) {
				result = service.deleteRcvMail(rec_no[i]);
				System.out.println("result : " + result);
			}
				String msg = "";
				if(result > 0) {
					msg = "게시글 삭제에 성공하였습니다.";
				} else {
					msg = "게시글 삭제에 실패하였습니다.";
				}
				return msg;
		}
		
	}
	

	
	
	
	@GetMapping("/insert")
	public ModelAndView insertMail(ModelAndView mv) {
		mv.setViewName("mail/insert");
		return mv;
	}
	
	@PostMapping("/insertText")
	@ResponseBody
	public ModelAndView sendTextEmail(HttpServletRequest request,
			HttpServletResponse response,
			MailRcv mailRcv,
			MailSend mailSend,
			ModelAndView mv,
			MultipartHttpServletRequest multi
			) throws Exception{

		
		String email_id = request.getParameter("emp_id");
		String email_pwd = request.getParameter("emp_pwd");
		
		
		//메일 관련 정보
		String host = "smtp.naver.com";
		final String username = email_id;
		final String password = email_pwd;
		int port= 465;
		
		
		//메일 내용
		String send_sender = username+"@naver.com";
		String send_receiver = request.getParameter("send_receiver"); // 받는 사람 이메일
		String send_title = request.getParameter("send_title"); // 제목
		String send_content = request.getParameter("send_content"); // 내용
		
		mailSend.setSend_sender(send_sender);
		mailSend.setSend_receiver(send_receiver);
		mailSend.setSend_title(send_title);
		mailSend.setSend_content(send_content);
		
		mailRcv.setRec_sender(send_sender);
		mailRcv.setRec_receiver(send_receiver);
		mailRcv.setRec_title(send_title);
		mailRcv.setRec_content(send_content);
		
		int resultSnd = service.insertSendMail(mailSend);
		int resultRcv = service.insertRcvMail(mailRcv);
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); //for debug
		
		Message mimeMessage = new MimeMessage(session);
		try
		{
		mimeMessage.setFrom(new InternetAddress(send_sender)); // 주소기입
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(send_receiver));
		mimeMessage.setSubject(send_title);
		mimeMessage.setContent(send_content, "text/html; charset=UTF-8");
		Transport.send(mimeMessage);
		} catch (AddressException e) {
			System.out.println(e);
		}
		
		
		mv.setViewName("mail/main");
		return mv;
	}
	
	
	@PostMapping("/insertFile")
	@ResponseBody
	public ModelAndView sendFileEmail(HttpServletRequest request,
			HttpServletResponse response,
			ModelAndView mv,
			MultipartHttpServletRequest multi,
			@RequestParam(value = "uploadfile", required = false) List<MultipartFile> attachedfiles,
			MailRcv mailRcv,
			MailSend mailSend
			) throws Exception{
//		MultipartFile file = multi.getFile("uploadfile0");
//		System.out.println("a: "+ file.getName());
//		System.out.println("a: "+ file.getOriginalFilename());
//		System.out.println("a: "+ file.getSize());
		System.out.println("a: "+ attachedfiles.get(0).getSize());
		
		/* size = Integer.parseInt(); */


		String retFormat = "";
		long fs = attachedfiles.get(0).getSize();
		String[] strArr = {"byte", "KB", "MB", "GB"};

		if(fs != 0) {
		  int idx = (int)Math.floor(Math.log(fs)/ Math.log(1024));
		  DecimalFormat df = new DecimalFormat("#,###.##");
		  long ret = (long) (fs / Math.pow(1024, Math.floor(idx)));
		  retFormat = df.format(ret) + " " + strArr[idx];
		}else {
		  retFormat += " "+ strArr[0];
		}
		
		System.out.println("retFormat :" + retFormat);
		
		
		String realPath = request.getSession().getServletContext().getRealPath("");
		String savePath = "resources\\uploadFiles";
		File folder = new File(realPath+savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		File file = null;
		
		long timeForRename = System.currentTimeMillis();
		if(attachedfiles != null) {
			for(int i = 0; i<attachedfiles.size(); i++) {
				String filePath = realPath+savePath+"\\"+ timeForRename +"_"+attachedfiles.get(i).getOriginalFilename();
				System.out.println(i+":"+filePath);
				file = new File(filePath);
				attachedfiles.get(i).transferTo(file);// request에 실려온 파일을 서버 PC에 저장함.
				}
				
			}
		String email_id = request.getParameter("emp_id");
		String email_pwd = request.getParameter("emp_pwd");
		String path = request.getParameter("path");
		
		//메일 관련 정보
		String host = "smtp.naver.com";
		final String username = email_id;
		final String password = email_pwd;
		int port= 465;
		
		//메일 내용
		String send_sender = username+"@naver.com";
		String send_receiver = request.getParameter("send_receiver"); // 받는 사람 이메일
		String send_title = request.getParameter("send_title"); // 제목
		String send_content = request.getParameter("send_content"); // 내용
		
		mailSend.setSend_sender(send_sender);
		mailSend.setSend_receiver(send_receiver);
		mailSend.setSend_title(send_title);
		mailSend.setSend_content(send_content);
		mailSend.setSend_filesize(retFormat);
		
		mailRcv.setRec_sender(send_sender);
		mailRcv.setRec_receiver(send_receiver);
		mailRcv.setRec_title(send_title);
		mailRcv.setRec_content(send_content);
		mailRcv.setRec_filesize(retFormat);
		
		int resultSnd = service.insertSendMail(mailSend);
		int resultRcv = service.insertRcvMail(mailRcv);
		
		Properties props = System.getProperties();
				
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", port);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", host);
				
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un=username;
				String pw=password;
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(un, pw);
				}
			});
		
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(send_sender));
			InternetAddress[] address = {new InternetAddress(send_receiver)};
            message.setRecipients(Message.RecipientType.TO, address);
            message.setSubject(send_title);
            
            MimeBodyPart mbp1 = new MimeBodyPart();
            mbp1.setContent(send_content, "text/html; charset=utf-8");
            
            MimeBodyPart mbp2 = new MimeBodyPart();
            if(file!= null) {
	            FileDataSource  fds = new FileDataSource(file.getAbsoluteFile()); //파일 읽어오기
	            mbp2.setDataHandler(new DataHandler(fds)); //파일 첨부
	            mbp2.setFileName(fds.getName());
            }
            Multipart mp = new MimeMultipart();
            mp.addBodyPart(mbp1);
            mp.addBodyPart(mbp2);
            
            message.setContent(mp);
            
            Transport.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("mail/main");
		return mv;
	}

}
