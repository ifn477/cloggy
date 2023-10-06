
package com.ezen.dog.review;

import java.util.ArrayList;

public interface Rservice {
	public void reviewinsert(String userId,  String r_content, String fname );
	public ArrayList<ReviewDTO> reviewout();
	public ReviewDTO reviewlist(int product_id);
}
