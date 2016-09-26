package com.oh.twin_peaks_graph.controller;

import java.util.Collections;

import org.neo4j.helpers.collection.IteratorUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oh.twin_peaks_graph.domain.Person;
import com.oh.twin_peaks_graph.domain.PersonRelationship;
import com.oh.twin_peaks_graph.repository.PersonRepository;

@Controller
public class PersonController {

	@Autowired
	private PersonRepository repo;

	@RequestMapping(value = "/person/{id}", method = RequestMethod.GET, headers = "Accept=text/html")
	public String singlePersonView(Model model, @PathVariable String id) {
		Person person = repo.findOne(Long.valueOf(id));
		model.addAttribute("person", person);

		return "/person/show";
	}

	@RequestMapping(value = "/people", method = RequestMethod.GET, headers = "Accept=text/html")
	public String listPeople(Model model) {
		Iterable<Person> people = repo.findAll();
		
		if (people != null)
			model.addAttribute("people", IteratorUtil.asCollection(people));
		else
			model.addAttribute("people", Collections.emptyList());

		return "/person/people";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET, headers = "Accept=text/html")
	public String createPerson(Model model) {
		model.addAttribute("person", new Person());

		return "/person/form";
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET, headers = "Accept=text/html")
	public String editPerson(Model model, @PathVariable String id) {
		model.addAttribute("person", repo.findOne(Long.valueOf(id)));

		return "/person/form";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST, headers = "Accept=text/html")
	public String savePerson(@ModelAttribute("person") Person person) {
		repo.save(person);

		return "redirect:people";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET, headers = "Accept=text/html")
	public String deletePerson(Model model, @PathVariable String id) {
		repo.delete(Long.valueOf(id));
		
		return "redirect:../people";
	}
	
	@RequestMapping(value = "/relationship/{type}", method = RequestMethod.GET, headers = "Accept=text/html")
	public String graphPeople(Model model, @PathVariable String type) {
		Iterable<PersonRelationship> people = repo.getRelationship(type);
		
		if (people != null)
			model.addAttribute("people", IteratorUtil.asCollection(people));
		else
			model.addAttribute("people", Collections.emptyList());

		return "/person/graph";
	}
}
