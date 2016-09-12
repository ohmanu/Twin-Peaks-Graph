package com.oh.twin_peaks_graph.repository;

import org.springframework.data.neo4j.repository.GraphRepository;

import com.oh.twin_peaks_graph.domain.Person;

public interface PersonRepository extends GraphRepository<Person>{

}
