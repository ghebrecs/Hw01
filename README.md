Homeworks - Submission instructions
=========

You have a private repository within the Organization
`CSCI4576-Fall2014` with your last name as the name of the
repository. To submit a homework please do the following steps:

1. Clone your private class repository, e.g.

    ```
	git clone https://github.com/CSCI4576-Fall2014/Hauser.git
	```
	
2. Go into the repository and create a folder for the homework you
    want to submit:

    ```
	mkdir HW01
	```

3. Add all the files you want to submit to the directory (never add
    object files or executables. The should be createable through `make`:

    ```
	cp triad.f90 .
	git add triad.f90
	```

4. Commit the files (once you know it's working):

	```
	git commit -a
	```

5. Push the file back to the remote repository on github.com:

    ```
	git push
	```
	
