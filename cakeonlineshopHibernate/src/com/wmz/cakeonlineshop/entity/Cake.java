package com.wmz.cakeonlineshop.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/*
 * cake类
 */
@Entity
@Table(name="tbl_cake")
public class Cake {
	private int id;
	private String name;
	private String description;
	private int price;
	private int discount;
	private String bigimg;
	private String img1;
	private String img2;
	private String img3;
	private int starlevel;
	private int size;
	private String tag;
	private CakeType type;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getBigimg() {
		return bigimg;
	}
	public void setBigimg(String bigimg) {
		this.bigimg = bigimg;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public int getStarlevel() {
		return starlevel;
	}
	public void setStarlevel(int starlevel) {
		this.starlevel = starlevel;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	/**
	 * 蛋糕和蛋糕类型之间多对一映射
	 * @return
	 */
	@ManyToOne()
	@JoinColumn(name="type")
	public CakeType getType() {
		return type;
	}
	public void setType(CakeType type) {
		this.type = type;
	}
}
