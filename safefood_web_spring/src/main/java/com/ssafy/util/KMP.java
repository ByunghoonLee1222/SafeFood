package com.ssafy.util;

public class KMP {
	public static boolean KMPSearch(String pat, String[] txt) 
    { 
		for(String temp : txt) {
		
		char[] T = pat.toCharArray();
		char[] P = temp.toCharArray();
		
		int tLength = T.length, pLength= P.length;
		int[] fail  = new int[pLength];
		
		for (int i = 1,j=0; i < pLength; ++i) {
			
			while(j>0 && P[i] != P[j]) j = fail[j-1];
			
			if(P[i]==P[j]) fail[i] = ++j;
		}
		
		int cnt=0;
		for (int i = 0, j=0; i < tLength; ++i) {

			while(j>0 && T[i] != P[j]) j = fail[j-1];
			
			if(T[i] == P[j]) {
				if(j == pLength-1) { 
					cnt++;
					j = fail[j];
				}else {
					++j;
				}
			}
			if(cnt>0) {
				return true;
			}
		}
		}
		return false;
    }
}
