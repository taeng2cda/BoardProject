package com.spring.datatree.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.datatree.Service.BoardService;
import com.spring.datatree.Vo.BoardVo;
import com.spring.datatree.Vo.PhotoVo;

@Controller
public class BoardCreatedController {
	
	@Autowired BoardService service;

	@GetMapping("/board/CreatedBoard")
	public String BoardView(Model model) {

		return "board/CreatedBoard";
	}
	
	@PostMapping("/board/CreatedBoard")
	public String BoardCreated(Model model,BoardVo vo) {
		
		System.out.println(vo.toString());
		vo.setCount(0);
		
		try {
			service.BoardInsert(vo);
			model.addAttribute("msg","정상등록 되었습니다");
			model.addAttribute("BoardInsert","success");
		
		}catch(Exception e) {
			System.out.println("게시판 생성 실패 : "+ e.getMessage());
			model.addAttribute("msg","게시글 생성에 실패하였습니다");
			model.addAttribute("BoardInsert","fail");
		}
		return "ViewResult/Result";
	}
	
	
	@RequestMapping("/board/photoUpload.do")
	public String photoImg(HttpServletRequest req,PhotoVo vo) {
		System.out.println("단일");
		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		try {
			if(vo.getFileData() != null && vo.getFileData().getOriginalFilename() != null && !vo.getFileData().getOriginalFilename().equals("")) {    
				
				//파일이 존재한다면
				String original_name = vo.getFileData().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".")+1);
				//파일 기본경로
				String defaultPath = req.getSession().getServletContext().getRealPath("/");
				
				//파일 기본경로 _ 상세경로
				String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;
				File file = new File(path);
				System.out.println("Path : " + path);
				
				//디렉토리가 존재하지 않을 경우 디렉토리 생성
				if(!file.exists()) {
					file.mkdirs();
				}
				
				//서버에 업로드 할 파일명
				String realname = UUID.randomUUID().toString()+"."+ext;
				
				//서버에 파일쓰기??
				vo.getFileData().transferTo(new File(path+realname));
				file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
				
			}else {file_result += "&errstr=error";  }
			
		}catch(Exception e) {
			System.out.println("파입 업로드 컨트롤러 에러 : " + e.getMessage());
		}
		return "redirect:" + callback + "?callback_func=" + callback_func+file_result;
	}
	
	
	@RequestMapping("/board/multiplephotoUpload.do")
	public void photoImg(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("멀티");
		try {
			
			//파일정보
			String sFileInfo = "";
			//파일명을 받는다 - 일반 원본파일명
			String filename = req.getHeader("file-name");
			//파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			//확장자를 소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			
			//파일 기본경로
			String dftFilePath = req.getSession().getServletContext().getRealPath("/");
			
			//파일 상세경로
			String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
			
			System.out.println("file path : " +filePath);
			File file = new File(filePath);
			
			if(!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString()+filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			
			//서버에 파일쓰기
			InputStream is = req.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(req.getHeader("file-size"))];
			while((numRead = is.read(b,0,b.length)) != -1) {
				os.write(b,0,numRead);
			}
			if(is != null) {
				is.close();
			}
			os.flush();
			os.close();
			
			//정보출력
			sFileInfo += "&bNewLine=true";
			sFileInfo += "&sFileName="+filename;;
			sFileInfo += "&sFileURL="+"/datatree/resources/photo_upload/"+realFileNm;
			PrintWriter print = resp.getWriter();
			print.print(sFileInfo);
			System.out.println("info : "+sFileInfo);
			print.flush();
			print.close();
			
		}catch(Exception e) {
			System.out.println("멀티 업로드 컨트롤러 에러 : "+e.getMessage());
		}
		
		
	}
	

}
