package com.oh.twin_peaks_graph.controller;

import java.util.Collections;

import org.neo4j.helpers.collection.IteratorUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oh.twin_peaks_graph.domain.Person;
import com.oh.twin_peaks_graph.repository.PersonRepository;

@Controller
public class PersonController {
	private Person person;

	@Autowired
	private PersonRepository repo;

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public String create() {
		repo.save(person);

		return "ok";
	}

	@RequestMapping(value = "/person/{id}", method = RequestMethod.GET, headers = "Accept=text/html")
	public String singlePersonView(Model model, @PathVariable String id) {
		Person person = repo.findOne(Long.valueOf(id));
		model.addAttribute("person", person);

		return "/person/show";
	}

	@RequestMapping(value = "/people", method = RequestMethod.GET, headers = "Accept=text/html")
	public String graphPeople(Model model) {
		Iterable<Person> people = repo.findAll();
		
		if (people != null) {
			model.addAttribute("people", IteratorUtil.asCollection(people));
		} else {
			model.addAttribute("people", Collections.emptyList());
		}

		return "/person/people";
	}
}