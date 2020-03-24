package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String currentTime = sdf.format(new Date());

		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf(".")); 
		String fileName = currentTime + ranNum + ext;
		
		File renameFile = new File(originFile.getParent(), fileName);
		
		return renameFile;
	}

}
