
```
git clone https://github.com/jupyter/jupyter.git
cd !$:t:r/docs
```

```
$ conda env create -f environment.yml
Solving environment: done


==> WARNING: A newer version of conda exists. <==
  current version: 4.4.10
  latest version: 4.5.1

Please update conda by running

---snip

#
# To activate this environment, use:
# > source activate jupyter_docs
#
# To deactivate an active environment, use:
# > source deactivate
#
```

```
$ source activate jupyter_docs
(jupyter_docs) $
```

```
$ make clean
rm -rf build/*
```

```
$ make html
sphinx-build -b html -d build/doctrees   source build/html
Running Sphinx v1.7.2
making output directory...
loading pickled environment... not yet created

--- snip ---
reading sources... [100%] use-cases/science
/home/ec2-user/jupyter/docs/source/development_guide/releasing.rst:4: WARNING: duplicate label releasing, other instance in /home/ec2-user/jupyter/docs/source/developer-docs/releasing.rst
/home/ec2-user/jupyter/docs/source/development_guide/rest_api.rst:211: WARNING: Malformed table.

+------------+-----------------+----------------------------------------+
| HTTP       | URL             | Action                                 |
| verb       |                 |                                        |
+============+=================+========================================+
| ``GET``    | /               | navigates user to dashboard of         |
|            |                 | notebooks and clusters.                |
+------------+-----------------+----------------------------------------+
| ``GET``    | /<notebook\_id> | go to wepage for that notebook         |
+------------+-----------------+----------------------------------------+
| ``GET``    | /new            | creates a new notebook with profile    |
|            |                 | (or default, if no profile exists)     |
|            |                 | setings                                |
+------------+-----------------+----------------------------------------+
| ``GET``    | /<notebook\_id> | opens a duplicate copy or the notebook |
|            | /copy           | with the given ID in a new tab       |
+------------+-----------------+----------------------------------------+
| ``GET``    | /<notebook\_id> | prints the notebook with the given ID; |
|            | /print          | if notebook doesn't exist, displays    |
|            |                 | error message                          |
+------------+-----------------+----------------------------------------+
| ``GET``    | /login          | navigates to login page; if no user    |
|            |                 | profile is defined, it navigates user  |
|            |                 | to dashboard                           |
+------------+-----------------+----------------------------------------+
| ``GET``    | /logout         | logs out of current profile, and       |
|            |                 | navigates user to login page           |
+------------+-----------------+----------------------------------------+
looking for now-outdated files... none found
pickling environment... done
checking consistency... done
preparing documents... done
writing output... [100%] use-cases/science
WARNING: dot command 'dot' cannot be run (needed for graphviz output), check the graphviz_dot setting
generating indices... genindex
writing additional pages... index search
copying images... [100%] architecture/figs/other_kernels.png
copying static files... done
copying extra files... done
dumping search index in English (code: en) ... done
dumping object inventory... done
build succeeded, 3 warnings.

The HTML pages are in build/html.

Build finished. The HTML pages are in build/html.
```
