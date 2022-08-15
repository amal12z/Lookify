package com.amalAltamimi.lookify.controllers;



import java.util.List;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amalAltamimi.lookify.models.Song;
import com.amalAltamimi.lookify.services.LookifyService;

@Controller
public class LookifyController {
	
	@Autowired
	public LookifyService lookifyService;


	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index.jsp";
	}
	
	// Render Homa Page 
	
	@RequestMapping(value="/dashboard" , method=RequestMethod.GET)
	public String dashboard(Model model) {
//		if(!model.containsAttribute("song")) { // @ModelAttrbute() Languages languages
//			model.addAttribute("song", new Song());
//		}
		List<Song> allSongs = lookifyService.allSongs();
		model.addAttribute("allSongs", allSongs);
		return "dashboard.jsp";
	}
	
	// render New Song page
	@RequestMapping(value="/songs/new" , method=RequestMethod.GET)
	public String newSongDispaly(Model model) {
		if(!model.containsAttribute("song")) { // @ModelAttrbute() Languages languages
			model.addAttribute("song", new Song());
		}
		return "addSong.jsp";
	}
	
	
	// store our data 
	@RequestMapping(value="/songs/new" , method=RequestMethod.POST)
	public String addSong(
			@Valid @ModelAttribute("song") Song song,
			BindingResult result,
			RedirectAttributes redirectAttributes) {
		// here
		Song newSong = lookifyService.createSong(song, result); // return NULL or SUCCESS CREATE LANGUAGE obj 
		
		if(newSong==null) {
			redirectAttributes.addFlashAttribute("song", song);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.song", result);
			return "redirect:/songs/new";
		}else {
			String songTitle = song.getTitle();
			redirectAttributes.addFlashAttribute("success" , "You Have been successfully add : " + songTitle + " song"); //????
			return "redirect:/dashboard";
		}

	}
	
	@RequestMapping(value="/songs/{id}" , method=RequestMethod.GET)
	public String songDetails(@PathVariable("id") Long id, Model model) {
		Song song = lookifyService.finedSong(id);
		model.addAttribute("song", song);
		return "songDetails.jsp";
	}
	
	
	// ************************
	@RequestMapping(value="/search" , method=RequestMethod.POST)
	public String search(@RequestParam(value="artist") String artist1, Model model){
		model.addAttribute("artistName", artist1);
		List<Song> searchResult = lookifyService.finedSongByArtist(artist1);
		model.addAttribute("searchResult", searchResult);
		return "search.jsp";
	}
	
	// findTopTen
	
	@RequestMapping(value="/topTen" , method=RequestMethod.GET)
	public String topTen(Model model){

		List<Song> topTen = lookifyService.findTopTen();
		model.addAttribute("topTen", topTen);
		return "topTen.jsp";
	}
	
	
	// 
	
	// DELETE ..
			@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
		    public String destroy(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
				String songTitle = lookifyService.finedSong(id).getTitle();
				lookifyService.deleteSong(id);
				
				redirectAttributes.addFlashAttribute("error" , "The Song with title : " +songTitle + " has been deleted");
				return "redirect:/dashboard";
				
		    }
	
	
	
	
	
}
