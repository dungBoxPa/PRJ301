/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Windows 10 TIMT
 */
public class Event {
    private int event_id;
    private String event_name;

    public Event() {
    }

    public Event(String event_name) {
        this.event_name = event_name;
    }
    
    public Event(int event_id) {
        this.event_id = event_id;
    }
    
    public Event(int event_id, String event_name) {
        this.event_id = event_id;
        this.event_name = event_name;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public String getEvent_name() {
        return event_name;
    }

    public void setEvent_name(String event_name) {
        this.event_name = event_name;
    }

    @Override
    public String toString() {
        return "Event{" + "event_id=" + event_id + ", event_name=" + event_name + '}';
    }
}
