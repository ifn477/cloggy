
package com.ezen.dog.review;

import java.util.ArrayList;

public interface Rservice {
	public void reviewinsert(String userId, int product_id, String r_content, String fname, String rating);
	public ArrayList<ReviewDTO> reviewlist(int product_id);
	public ReviewDTO reviewout(int product_id);
}
