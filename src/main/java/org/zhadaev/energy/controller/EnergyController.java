package org.zhadaev.energy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zhadaev.energy.DAO.EnergyDao;
import org.zhadaev.energy.model.Form;

import java.util.List;

@Controller
public class EnergyController {

    @Autowired
    private EnergyDao energyDao;

    @GetMapping("/")
    public String startPage() {
        return "energy";
    }

    @GetMapping("/table")
    @ResponseBody
    public List<Form> getAllForms() {
        return energyDao.getAllForms();
    }
}
