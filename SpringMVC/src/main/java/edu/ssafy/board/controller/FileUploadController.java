package edu.ssafy.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileUploadController {
	@RequestMapping("/uploadForm")
	public void fileUploadForm() {
	}

	@RequestMapping("/fileupload")
	public String fileUpload(HttpServletRequest req, Model m) {
		// file upload coding
		String path = "c:\\fileup";
		MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
		Iterator<String> iter = mhsr.getFileNames();
		ArrayList<Map<String, File>> list = new ArrayList<Map<String, File>>();

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		String fieldName = "";
		while (iter.hasNext()) {
			fieldName = iter.next();
			MultipartFile mfile = mhsr.getFile(fieldName);

			// 한글 처리
			String fileName;
			try {
				fileName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
				// 파일이 없는 경우 처리
				if ("".equals(fileName)) {
					continue;
				}
				File serverFile = new File(path + File.separator + fileName);
				System.out.println(path + File.separator + fileName);
				mfile.transferTo(serverFile);
				Map<String, File> map = new HashMap<String, File>();
				map.put("serverFile", serverFile);
				list.add(map); // 파일 목록 저장

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		m.addAttribute("msg", "fileUpload");
		return "result";
	}
}