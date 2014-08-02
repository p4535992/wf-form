package org.alfresco.consulting.evaluators;

import org.springframework.extensions.config.evaluator.Evaluator;

/**
 * Regex based Evaluator
 * @author Alexander Mahabir
 *
 */
public class StringRegexEvaluator implements Evaluator {
	
	@Override
	public boolean applies(Object obj, String condition) {
		if (obj instanceof String &&  ((String) obj).matches(condition)  )
			return true;
		return false;
	}

}
