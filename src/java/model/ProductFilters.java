/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Windows 10 TIMT
 */
public class ProductFilters {

    List<String> filterOptions;

    public ProductFilters() {
        filterOptions = new ArrayList<>();
    }

    public ProductFilters(List<String> filterOptions) {
        this.filterOptions = filterOptions;
    }

    public List<String> getFilterOptions() {
        return filterOptions;
    }

    public void setFilterOptions(List<String> filterOptions) {
        this.filterOptions = filterOptions;
    }
    
    public void addFilter(String filter){
        filterOptions.add(filter);
    }

    @Override
    public String toString() {
        return "ProductFilters{" + "filterOptions=" + filterOptions + '}';
    }

}
