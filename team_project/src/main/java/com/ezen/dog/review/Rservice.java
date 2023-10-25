
package com.ezen.dog.review;

import java.util.ArrayList;

public interface Rservice {
	public void reviewinsert(String userId,  String r_content, String fname, String rating);
	public ArrayList<ReviewDTO> reviewout(int product_id);
	public ReviewDTO reviewlist(int product_id);
}
