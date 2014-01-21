package com.scandilabs.www.util;

import java.lang.reflect.InvocationTargetException;
import java.util.Comparator;

import org.apache.commons.beanutils.PropertyUtils;

/**
 * Same as BeanPropertyComparator but reverses the order
 * 
 * @author mkvalsvik
 * 
 */
public class ReverseBeanPropertyComparator implements Comparator {

	public ReverseBeanPropertyComparator(String sortPropertyName) {
		this.sortPropertyName = sortPropertyName;
	}

	private String sortPropertyName;

	public int compare(Object o1, Object o2) {
		Object property1 = null;
		Object property2 = null;
		try {
			property1 = PropertyUtils.getProperty(o1, this.sortPropertyName);
			property2 = PropertyUtils.getProperty(o2, this.sortPropertyName);
		} catch (IllegalAccessException e) {
			throw new RuntimeException("Exception invoking getter "
					+ sortPropertyName + ": " + e.toString());
		} catch (InvocationTargetException e) {
			throw new RuntimeException("Exception invoking getter "
					+ sortPropertyName + ": " + e.toString());
		} catch (NoSuchMethodException e) {
			throw new RuntimeException("Exception invoking getter "
					+ sortPropertyName + ": " + e.toString());
		}
		return org.apache.commons.collections.ComparatorUtils.NATURAL_COMPARATOR
				.compare(property2, property1);
	}

}
