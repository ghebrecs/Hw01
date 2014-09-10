test ones
Homeworks - Submission instructions
=========

You have a private repository within the Organization
`CSCI4576-Fall2014` with your last name as the name of the
repository. To submit a homework please do the following steps:

1. Clone your private class repository, e.g.

		git clone https://github.com/CSCI4576-Fall2014/Hauser.git
	
2. Go into the repository and create a folder for the homework you
    want to submit, e.g HW01, HW02, ...:

		mkdir HW01


3. Add all the files you want to submit to the directory (never add
    object files or executables. The should be createable through `make`:

		cp triad.f90 .
		git add triad.f90


4. Commit the files (once you know it's working):

		git commit -a

5. Push the file back to the remote repository on github.com:

		git push


# Accessing your Homework assignments

To access your homework assignments the following steps should work
for you:

1. Clone the repository (you only have read access):

		git clone https://github.com/CSCI4576-Fall2014/Homeworks.git
		ls -al
		drwxr-xr-x  16 tom  staff  544 Sep  4 08:06 .git
		-rw-r--r--   1 tom  staff  178 Sep  1 21:43 .gitignore
		drwxr-xr-x   8 tom  staff  272 Sep  2 16:27 HW01
		-rw-r--r--   1 tom  staff  816 Sep  3 06:56 README.md


2. Update the repository when we announce a new homework:

		git pull

