package com.manognareddy.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class FileCounter {

	public static String fileCountData = "fileCountData";
	private static Map<String, Integer> dataMap = new HashMap<>();

	public static void countFiles(String tag) {
		Lock lock = new ReentrantLock();
		try {
			lock.lock();
			String parentFolderName = Constants.IMG_DIR_PATH + tag + Constants.FORWARD_SLASH;
			String subTag = Constants.MAX;

			File folder = new File(parentFolderName + subTag);
			int count = 0;
			if (folder != null && folder.list() != null) {
				count = folder.list().length;
				dataMap.put(tag.concat(subTag), count);
			}

			subTag = Constants.MED;
			folder = new File(parentFolderName + subTag);
			if (folder != null && folder.list() != null) {
				count = folder.list().length;
				dataMap.put(tag.concat(subTag), count);
			}

			subTag = Constants.MIN;
			folder = new File(parentFolderName + subTag);
			if (folder != null && folder.list() != null) {
				count = folder.list().length;
				dataMap.put(tag.concat(subTag), count);
			}
		} finally {
			lock.unlock();
		}
	}
	
	public static int getCountInFolder(String tag, String forSubtag) {
		Lock lock = new ReentrantLock();
		int count = 0;
		try {
			lock.lock();
			String parentFolderName = Constants.IMG_DIR_PATH + tag + Constants.FORWARD_SLASH;
			String subTag = Constants.MAX;

			File folder = new File(parentFolderName + subTag);
			if (folder != null && folder.list() != null) {
				count = folder.list().length;
			}
		} finally {
			lock.unlock();
		}
		return count;
	}

	public static int getCount(String tag, String subTag) {
		countFiles(tag);
		Integer cnt = dataMap.get(tag.concat(subTag));
		return cnt == null ? 0 : cnt;
	}
	
	public static String[] getFileNames(String tag, String subTag) {
		File dir = new File(Constants.IMG_DIR_PATH+"/"+tag+"/"+subTag);
		String[] namesArr = dir.list();
		if(namesArr == null){
			namesArr = new String[0];
		}
		return dir.list();
	}

}
