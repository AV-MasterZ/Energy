package org.zhadaev.energy.model;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class FormMapper implements RowMapper<Form> {

    @Override
    public Form mapRow(ResultSet rs, int i) throws SQLException {
        Form form = new Form();
        form.setDate(rs.getDate("dt"));
        form.setIncome(rs.getString("Маржинальный доход"));
        form.setEnergyIncome(rs.getString("Выручка за электроэнергию"));
        form.setEnergyPrice(rs.getString("Цена"));
        form.setEnergyVolume(rs.getString("Объём"));
        form.setEnergyIncomeResale(rs.getString("Выручка за электроэнергию перепродажа"));
        form.setEnergyIncomeResalePrice(rs.getString("Цена РСВ"));
        form.setEnergyIncomeResaleVolume(rs.getString("Объём РСВ"));
        form.setBuyIncomeResale(rs.getString("Покупка электроэнергии перепродажа"));
        form.setBuyIncomeResalePrice(rs.getString("Цена БР"));
        form.setBuyIncomeResaleVolume(rs.getString("Объём БР"));
        return form;
    }
}
