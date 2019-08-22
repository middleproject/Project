package com.sist.manager;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.RecipeDAO;
import com.sist.vo.RecipeVO;


public class RecipeManager {
	public static void main(String[] args) {
		RecipeManager rm =new RecipeManager();
		List<RecipeVO> list = rm.recipeAllData();
		int i=1;
		for(RecipeVO vo:list){
			RecipeDAO.cateDateInsert(vo);
			System.out.println(i);
			i++;
		}
		System.out.println("Save end");
	}
	public List<RecipeVO> recipeAllData(){
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		try {
			for(int k=10; k<11;k++){
				Document doc = Jsoup.connect("http://www.10000recipe.com/recipe/list.html?order=date&niresource=%2Frecipe%2F6917457&page="+k).get();
				Elements summary = doc.select("div.row div.caption h4");
				Elements poster = doc.select("div.row div.col-xs-4 img");
				Elements made = doc.select("div.row div.caption p");	
				Elements in =doc.select("a.thumbnail");	
				
				for(int i=0; i<summary.size();i++){
					Document doc2 = Jsoup.connect("http://www.10000recipe.com"+in.get(i).attr("href")).get();
					Elements sumary_in = doc2.select("div.view2_summary_in");
					
					Elements docinfo = doc2.select("div.view2_summary span");
					
					String info ="";
					for(int j=0;j<docinfo.size();j++){
						 info +=docinfo.get(j).text()+"##";
					}
					String ingre ="";
					String ingreunit ="";
					String s="";
					Elements ingre12 = doc2.select("div.ready_ingre3 li");
					Elements ingre123 = doc2.select("div.ready_ingre3 li span");
					for(int w=0;w < ingre12.size(); w++){
						ingre = ingre12.get(w).html();
						
						s += ingre.substring(0, ingre.indexOf("<"))+",";
					}
					s=s.substring(0, s.lastIndexOf(","));
					
					
					
					
					Elements instep = doc2.select("div.media-body");
					Elements instep_poster =doc2.select("div.view_step_cont img");
					String step_poster="";
					String step ="";
					for(int y=0;y<instep.size();y++){
						step += instep.get(y).text()+"##";
					}
					for(int c=0;c<instep_poster.size();c++){
						step_poster+= instep_poster.get(c).attr("src")+"##";
					}
					Elements tip =doc2.select("dl.view_step_tip dd");
					Elements date = doc2.select("p.view_notice_date b");
					Elements intag = doc2.select("div.view_tag a");
					
					String tag="";
					for(int a=0; a<intag.size();a++){
						tag+=intag.get(a).text()+",";
					}
					Elements comment = doc2.select("p.cont_intro");
					Elements hit = doc2.select("div.view_cate_num span.hit");
					Elements comple = doc2.select("div.carousel-inner img");
					String complete ="";
					for(int b=0;b<comple.size();b++){
						complete += comple.get(b).attr("src")+",";
					}
//					System.out.println("ï¿½ï¿½ï¿½ï¿½:"+sumary_in.text());
					System.out.println("Á¦¸ñ:"+summary.get(i).text());
//					System.out.println("ï¿½Û¼ï¿½ï¿½ï¿½:"+made.get(i).text());
//					System.out.println("ï¿½ï¿½Â¥:"+date.text());
//					ready_ingre3
//					System.out.println("ï¿½ä¸®ï¿½ï¿½ï¿½ï¿½:"+step);
//					System.out.println("ï¿½ä¸® ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:"+step_poster);
//					System.out.println("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:"+poster.get(i).attr("src"));
//					System.out.println("ï¿½Ï·ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:"+complete);
//					System.out.println("ï¿½Ú¸ï¿½Æ®:"+comment.text());
//					System.out.println("ï¿½ï¿½:"+tip.text());
//					System.out.println("ï¿½ï¿½È¸ï¿½ï¿½:"+hit.text());
//					System.out.println("ï¿½Â±ï¿½:"+tag);
					System.out.println("Àç·á:"+s);
					System.out.println("´ÜÀ§:"+ingreunit);
					RecipeVO vo = new RecipeVO();
					vo.setSummary(summary.get(i).text());
					vo.setMade(made.get(i).text());
					vo.setSummary_in(sumary_in.text());
					vo.setRegdate(date.text());
					vo.setStep(step);
					vo.setSTEP_POSTER(step_poster);
					vo.setPoster(poster.get(i).attr("src"));
					vo.setComplete(complete);
					vo.setHit(Integer.parseInt(hit.text().replace(",", "")));
					vo.setIngre(ingre);
					vo.setTag(tag);
					vo.setTip(tip.text());
					vo.setInfo(info);
					list.add(vo);
					}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
