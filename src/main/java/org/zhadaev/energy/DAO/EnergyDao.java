package org.zhadaev.energy.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.zhadaev.energy.model.Form;
import org.zhadaev.energy.model.FormMapper;

import java.io.InputStream;
import java.util.List;
import java.util.Scanner;

@Repository
public class EnergyDao {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    private FormMapper formMapper;

    public List<Form> getAllForms() {
        return jdbcTemplate.query(getQuery("query.sql"), formMapper);
    }

    private String getQuery(final String filename) {

        StringBuilder result = new StringBuilder();
        InputStream in = EnergyDao.class.getResourceAsStream("/" + filename);
        Scanner scanner = new Scanner(in);
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            result.append(line);
        }
        scanner.close();

        return result.toString();

    }


}
