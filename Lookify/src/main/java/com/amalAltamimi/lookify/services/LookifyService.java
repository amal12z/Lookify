package com.amalAltamimi.lookify.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.amalAltamimi.lookify.models.Song;
import com.amalAltamimi.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {

	
	@Autowired
	public LookifyRepository lookifyRepository;
	
	// add song .. 
	
	public Song createSong(Song song, BindingResult result) {
		Optional<Song> OptionalSong =  lookifyRepository.findByTitle(song.getTitle());
		// if Name Exists : Error 
		if(OptionalSong.isPresent()) {
			result.rejectValue("title", "unique", "Song Already Exists");
		}
		
		// if Title or password have errors : null ****
		if(result.hasErrors()) {
			return null;
		}else { 
			return lookifyRepository.save(song);}
		}
	
	// 
	public List<Song> allSongs(){
		return lookifyRepository.findAll();
	}
	
	
	public Song finedSong(Long id){
		Optional<Song> optionalSong =  lookifyRepository.findById(id);
		 if(optionalSong.isPresent()) {
			 return optionalSong.get();
		 }else {
			 return null;
		 }	
		 }
	
	
	public List<Song> finedSongByArtist(String artist){
	List<Song> optionalSong =  lookifyRepository.findByArtist(artist);
		 return optionalSong;
	 }
	
	
	
	public List<Song> findTopTen(){
		return lookifyRepository.findTop10ByOrderByRatingDesc();
	}
	
	
	// DELETE
			public Song deleteSong(Long id) {
				Optional<Song> optionalSong = lookifyRepository.findById(id);
				if(optionalSong.isPresent()) {
					Song song = optionalSong.get();
					lookifyRepository.deleteById(song.getId());
					return song;
				}else {
					return null;
				}
				}
	
	// finedSongByArtist *********
//	public List<Song> finedSongByArtist(String artist){
//		List<Song> optionalSong =  lookifyRepository.findByArtist(artist);
//		 if(optionalSong.isPresent()) {
//			 ArrayList<Song> songsResult = optionalSong.get();
//			 return songsResult;
//		 }else {
//			 return null;
//		 }	
//		 }
	
	
	
	
	// finedSongByArtist
//		public Song finedSongByArtist(String artist){
//			Optional<Song> optionalSong =  lookifyRepository.findByArtist(artist);
//			 if(optionalSong.isPresent()) {
//				 List<Song> songsResult = optionalSong.get();
//				 return songsResult;
//			 }else {
//				 return null;
//			 }	
//			 }
	
}
