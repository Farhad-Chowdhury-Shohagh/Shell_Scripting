#!/bin/bash
# Project 6: Student Result Management System
# Takes marks, calculates total, average, and grade.

RESULT_FILE="student_results.txt"

read -p "Enter student name: " NAME
read -p "Enter mark for Subject 1: " M1
read -p "Enter mark for Subject 2: " M2
read -p "Enter mark for Subject 3: " M3
read -p "Enter mark for Subject 4: " M4
read -p "Enter mark for Subject 5: " M5

TOTAL=$((M1 + M2 + M3 + M4 + M5))
AVERAGE=$((TOTAL / 5))

if [ "$AVERAGE" -ge 80 ]; then
    GRADE="A+"
elif [ "$AVERAGE" -ge 70 ]; then
    GRADE="A"
elif [ "$AVERAGE" -ge 60 ]; then
    GRADE="B"
elif [ "$AVERAGE" -ge 50 ]; then
    GRADE="C"
elif [ "$AVERAGE" -ge 40 ]; then
    GRADE="D"
else
    GRADE="F"
fi

{
echo "Name: $NAME"
echo "Total Marks: $TOTAL"
echo "Average: $AVERAGE"
echo "Grade: $GRADE"
echo "-----------------------------"
} | tee -a "$RESULT_FILE"

echo "Result saved in $RESULT_FILE"
