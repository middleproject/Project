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
		int q=0;
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		try {
			for(int k=2; k<350;k++){
				Document doc = Jsoup.connect("http://www.10000recipe.com/recipe/list.html?order=date&niresource=%2Frecipe%2F6917457&page="+k).get();
				Elements summary = doc.select("div.row div.caption h4");
				
				Elements made = doc.select("div.row div.caption p");	
				Elements in =doc.select("a.thumbnail");	
				
				for(int i=0; i<summary.size();i++){
					Document doc2 = Jsoup.connect("http://www.10000recipe.com"+in.get(i).attr("href")).get();
					Elements sumary_in = doc2.select("div.view2_summary_in");
					Elements poster = doc2.select("div.centeredcrop img");
					Elements docinfo = doc2.select("div.view2_summary span");
					Elements img = doc2.select("div.user_info2 img");
					String image = img.attr("src");
					String info ="";
					for(int j=0;j<docinfo.size();j++){
						 info +=docinfo.get(j).text()+"##";
					}
					String ingre ="";

					String s="";
					Elements ingre12 = doc2.select("div.ready_ingre3 li");
					if(ingre12==null){
						continue;
					}
					for(int w=0;w < ingre12.size(); w++){
						ingre = ingre12.get(w).html();
						
						s += ingre.substring(0, ingre.indexOf("<"))+",";
					}
					//s=s.substring(0, s.lastIndexOf(","));
					
					
					
					
					Elements instep = doc2.select("div.media-body");
					Elements instep_poster =doc2.select("div.view_step_cont img");
					String step_poster="";
					String step ="";
				
					if(instep.size()==0) {
						instep = doc2.select("div.view_step");
						instep_poster =doc2.select("div.view_step img");
					}
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
//					System.out.println("����:"+sumary_in.text());
					//System.out.println("����:"+summary.get(i).text());
//					System.out.println("�ۼ���:"+made.get(i).text());
//					System.out.println("��¥:"+date.text());
//					ready_ingre3
//					System.out.println("�丮����:"+step);
//					System.out.println("�丮 ���� ������:"+step_poster);
//					System.out.println("����������:"+poster.get(i).attr("src"));
//					System.out.println("�Ϸ� ������:"+complete);
//					System.out.println("�ڸ�Ʈ:"+comment.text());
//					System.out.println("��:"+tip.text());
//					System.out.println("��ȸ��:"+hit.text());
//					System.out.println("�±�:"+tag);
					
					System.out.println(q);
					if(instep.size()==0) continue;
					
					RecipeVO vo = new RecipeVO();
					vo.setSummary(summary.get(i).text());
					vo.setMade(made.get(i).text());
					vo.setSummary_in(sumary_in.text());
					vo.setRegdate(date.text());
					vo.setStep(step);
					vo.setSTEP_POSTER(step_poster);
					vo.setPoster(poster.attr("src"));
					vo.setComplete(complete);
					vo.setHit(Integer.parseInt(hit.text().replace(",", "")));
					vo.setIngre(s);
					vo.setTag(tag);
					vo.setTip(tip.text());
					vo.setInfo(info);
					vo.setImage(image);
					list.add(vo);
					q++;
					}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
