package com.wmz.cakeonlineshop.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_type")
public class CakeType {
	private int id;
	private String name;
	private Set<CakeType> childTypes=new HashSet<CakeType>();
	private CakeType parentType;
	private Set<Cake> cakes=new HashSet<Cake>();
	
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
	
	/**
	 * 蛋糕父类型和子类型一对多映射
	 * @return
	 */
	@OneToMany(mappedBy="parentType",targetEntity=CakeType.class,cascade= {CascadeType.REMOVE})
	public Set<CakeType> getChildTypes() {
		return childTypes;
	}
	public void setChildTypes(Set<CakeType> childTypes) {
		this.childTypes = childTypes;
	}
	
	/**
	 * 蛋糕子类型和父类型多对一映射
	 * @return
	 */
	@ManyToOne()
	@JoinColumn(name="parentId")
	public CakeType getParentType() {
		return parentType;
	}
	public void setParentType(CakeType parentType) {
		this.parentType = parentType;
	}
	
	/**
	 * 蛋糕类和蛋糕的一对多映射
	 * @return
	 */
	@OneToMany(mappedBy="type",targetEntity=Cake.class,cascade= {CascadeType.REMOVE})
	public Set<Cake> getCakes() {
		return cakes;
	}
	public void setCakes(Set<Cake> cakes) {
		this.cakes = cakes;
	}
}
