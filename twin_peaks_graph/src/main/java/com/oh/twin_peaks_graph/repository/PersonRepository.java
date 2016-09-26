package com.oh.twin_peaks_graph.repository;

import java.util.List;

import org.springframework.data.neo4j.annotation.Query;
import org.springframework.data.neo4j.repository.GraphRepository;
import org.springframework.data.repository.query.Param;

import com.oh.twin_peaks_graph.domain.Person;
import com.oh.twin_peaks_graph.domain.PersonRelationship;

public interface PersonRepository extends GraphRepository<Person>{

	@Query( "MATCH (p1:Person)-[r]->(p2:Person) " +
            "WHERE type(r) = {relationship} " +
			"RETURN p1 AS person1, p2 AS person2")
	List<PersonRelationship> getRelationship(@Param("relationship") String relationship);
}
