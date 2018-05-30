<?php

namespace App\Models;

class Degree extends \Core\Model 
{
	public static function getDegreeCourses($program)
	{
		$sql = "SELECT pr.program_id, program_name, program_level, c.course_code, c.course_name, credit_hours, prereq_code, p.course_name as 
				'prerequisite'
				FROM program pr
				JOIN program_outline USING(program_id)
				JOIN course c USING(course_code)
				JOIN (
					SELECT p.course_code, prereq_code, course_name
					FROM course c JOIN prerequisite p
					ON c.course_code = prereq_code
				)  p
				ON c.course_code = p.course_code
				WHERE pr.program_id = :program
				ORDER BY program_id,program_level, course_code, prereq_code;";
		
		$stmt = static::getDB()->prepare($sql);
		$stmt->bindParam(':program', $program, \PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);
	}//end getDegreeCourses
	
	
	public static function getProgramId($student)
	{
		$sql = "SELECT program_id FROM student WHERE user_id = :student";
		$stmt = static::getDB()->prepare($sql);
		$stmt->bindParam(':student', $student, \PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetch(\PDO::FETCH_ASSOC);
		
	}
	
	
	
}
