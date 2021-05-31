package com.notifier_application.beans;

import java.time.LocalDate;
import java.util.Date;

public class NotesBean 
{
	private String note_name;
	private LocalDate start_date;
	private LocalDate end_date;
	private LocalDate reminder_date;
	private String status;
	private String tag;
	private String description;
	private int notebook_id;
	private int note_id;
	
	
	
	public int getNote_id() {
		return note_id;
	}

	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}
	
	public NotesBean()
	{
		
	}

	public NotesBean(String note_name, LocalDate reminder_date, String status, int note_id) {
		super();
		this.note_name = note_name;
		this.reminder_date = reminder_date;
		this.status = status;
		this.note_id = note_id;
	}

	public NotesBean(String note_name, LocalDate start_date, LocalDate end_date, LocalDate reminder_date, String status, String tag,
			String description) {
		super();
		this.note_name = note_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.reminder_date = reminder_date;
		this.status = status;
		this.tag = tag;
		this.description = description;
	}
	
	public NotesBean(String note_name, LocalDate start_date, LocalDate end_date, LocalDate reminder_date, String status, String tag,
			String description, int note_id) {
		super();
		this.note_name = note_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.reminder_date = reminder_date;
		this.status = status;
		this.tag = tag;
		this.description = description;
		this.note_id = note_id;
	}
	
	public NotesBean(int notebook_id,String note_name, LocalDate start_date, LocalDate end_date, LocalDate reminder_date, String status, String tag,
			String description) {
		super();
		this.notebook_id = notebook_id;
		this.note_name = note_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.reminder_date = reminder_date;
		this.status = status;
		this.tag = tag;
		this.description = description;
		
	}
	
	public String getNote_name() {
		return note_name;
	}
	public void setNote_name(String note_name) {
		this.note_name = note_name;
	}
	public LocalDate getStart_date() {
		return start_date;
	}
	public void setStart_date(LocalDate start_date) {
		this.start_date = start_date;
	}
	public LocalDate getEnd_date() {
		return end_date;
	}
	public void setEnd_date(LocalDate end_date) {
		this.end_date = end_date;
	}
	public LocalDate getReminder_date() {
		return reminder_date;
	}
	public void setReminder_date(LocalDate reminder_date) {
		this.reminder_date = reminder_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getNotebook_id() {
		return notebook_id;
	}
	public void setNotebook_name(int notebook_id) {
		this.notebook_id = notebook_id;
	}
	
	

}
