package com.oh.twin_peaks_graph.repository;

import java.util.List;

import org.springframework.data.neo4j.annotation.Query;
import org.springframework.data.neo4j.repository.GraphRepository;

import com.oh.twin_peaks_graph.domain.Person;
import com.oh.twin_peaks_graph.domain.PersonRelationship;

public interface PersonRepository extends GraphRepository<Person>{

	@Query( "MATCH (p1:Person)-[r:MARRIED]->(p2:Person)" +
            " RETURN p1 as person1, p2 as person2")
	List<PersonRelationship> getRelationship(String relationship);
}
