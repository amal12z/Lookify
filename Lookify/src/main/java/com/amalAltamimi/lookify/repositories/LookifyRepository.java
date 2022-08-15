package com.amalAltamimi.lookify.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.amalAltamimi.lookify.models.Song;

@Repository
public interface LookifyRepository extends CrudRepository<Song, Long>{

	List<Song> findByArtist(String artist);
	List<Song> findAll();
	Optional<Song> findByTitle(String name);
	Optional<Song> findById(Long id);
	List<Song> findTop10ByOrderByRatingDesc();
	
	
//	@Query(value="SELECT * FROM Song song ORDER BY song.rating LIMIT :10", nativeQuery=true)
//	Song getSongByLimit(@Param("limit") int limit);
}
