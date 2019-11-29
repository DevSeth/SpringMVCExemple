package com.mkyong.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HelloController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {

		model.addAttribute("message", "Spring 3 MVC Hello World");
																			// message : peut être exploité sur la page /
																			// : l'objet doit alors déjà exister. D'où vient message ?

		// Tentative d'ajout d'un objet : start
		String startInfo = "Info de depart";
		model.addAttribute("start",startInfo);									// Fonctionne : peut être récupéré sur la page de garde. Et sur la page hello/jp ?

		return "hello";

	}

	@RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
	public ModelAndView hello(@PathVariable String name) {			// Autre forme de déclaration @PathVariable, si le nom de l'argument est = au nom de la variable

		ModelAndView model = new ModelAndView();

		model.setViewName("hello");
		model.addObject("msg", name);								// Récupéré dans hello.jsp avec le bon path !

		// Tentative : ajout d'un autre objet : info. Cet objet est créé à l'appel de /hello/{name}
		String info = "mon info ici";
		model.addObject("info", info);								// Fonctionne ! Cette string est récupérée.
																	// Existe-t-elle toujours si je reviens à la page de garde ??? : Non, le if statement jsp ne donne pas de résultat.


		// model.addAttribute("info", "Test message");		// Ne fonctionne pas ici (cannot find symbol) (pour message, ou info par ex).

		return model;

	}

	// Tentative de fabrication d'une liaison vers une nouvelle page. Cette méthode agit sur la view toto.jsp
	// Le bouton central envoie sur /toto/monmessage
	// Cette méthode fonctionne. toto.jsp est appelé. Souci sur la page jsp : les variables ne sont pas interprétée
	@RequestMapping(value = "/toto/{name:.+}", method = RequestMethod.GET)
	public ModelAndView toto(@PathVariable("name") String name) {

		ModelAndView model = new ModelAndView();
		model.setViewName("toto");
		model.addObject("msg", name);					// Tentative de placer ici monmessage dans msg. Ca marche, msg existe et peut être récupéré dans toto.jsp

		// model.addAttribute("message",name);			// Ne fonctionne pas (cannot find symbol)
														// Pourtant message existe dans toto.jsp : j'ai un blanc au lieu d'avoir ${message} en toutes lettres, comme pour ${name}

		return model;

	}

	// Tentative de liaison vers une autre page, avec paramètres d'entrée multiples
	// RegEx : Si id est un texte : sans RegEx, il y aura HTTP Requête invalide car id est déclaré int. Avec RegEx, la page ne sera tout simplement pas trouvée (HTTP 404 not found)
	@RequestMapping(value = "/mul/{name:.+}/number/{id:[\\d]+}", method = RequestMethod.GET)
	public ModelAndView multiple(@PathVariable("name") String name, @PathVariable("id") int id) {

		ModelAndView model = new ModelAndView();
		model.setViewName("multiple");					// multiple.jsp
		model.addObject("nom", name);
		model.addObject("identifiant", id);

		return model;

	}

	@RequestMapping(value = "/param", params = "choice", method = RequestMethod.GET)
	public ModelAndView param(@RequestParam("choice") int choice) {

		ModelAndView model = new ModelAndView();
		model.setViewName("param");					// param.jsp
		model.addObject("number", choice);

		return model;

	}

}