Introduction to LLVM IR. 

This readme provides you with the commands to be used for the generation of LLVM IR, CFG, call-graph, assembly code from ll file & vice versa, and performing optimizations such as loop invariant code motion, dead code elimination, constant propagation.

IMP:
Add these aliases in .bashrc file in root directory of your docker container for ease in use of below mentioned tools:
alias opt='/llvm-project/build/bin/opt'
alias clang='/llvm-project/build/bin/clang'
alias llvm-as='/llvm-project/build/bin/llvm-as'
alias llvm-dis='/llvm-project/build/bin/llvm-dis'

Once the changes are saved to file, run 'source .bashrc' in the root directory itself for changes to take effect.


================================================ COMMANDS ================================================
Run opt --help | grep "flag" to see the description of the flag used in the commands.
ex: opt --help | grep "-S"

1. Generating LLVM IR from source code:
$ clang -S -emit-llvm filename.c/cpp -o outputFilename.ll

2. Generating LLVM IR with disable-O0-optnone for performing optimizations on generated LLVM IR:
$ clang -S -emit-llvm -Xclang -disable-O0-optnone filename.c -o outputFilename.ll

3. Generating the bitcode from an LLVM IR:
$ llvm-as <input.ll> -o <output.bc>

4. Generating back LLVM IR from bitcode:
$ llvm-dis <input.bc> -0 <output.ll>

3. Performing classic optimizations (O1, O2, etc.):
$ opt -S --O1 <input.ll> -o <output.ll>

4. Performing loop invariant code motion: 
$ opt -S --licm <input.ll> -o <output.ll>

5. Performing dead code elimination:
$ opt -S --mem2reg --domtree --dce <input.ll> -o <output.ll> 

6. Performing constant propagation:
$ opt -S --mem2reg --constprop <input.ll> -o <output.ll>

7. Generating target specific code using LLC:
$ llc --filetype=[asm|obj|null] --march=<architecture> <input.ll>

8. Generating CFG from LLVM IR:
$ opt --view-cfg <input.ll>

It may result in GTK related error from xdot application but dot file of CFG is saved in /tmp directory. NOTE THE NAME OF GENERATED DOT FILE.

9. Viewing CFG of LLVM IR:
Option-1: Install Graphviz extension in VSCode(or other code editors) and preview dot file generated above in command-7.

Option-2: Convert dot to png and view in your host machine.
$ dot -Tpng /tmp/<input.dot> -o <output.png>
$ code <output.png>  (If you are using VSCode. Double click on the png file or drop it in the editor to view CFG.)

Option-3: An alternative to viewing CFG in case of no editors can be to generate respective png files and then copying them from container to local using 'docker cp <container-name/id:path_to_png_file> <destination in local>' and viewing them locally.

llc commands used: 

llc --filetype=obj --march=x86 dce.ll (Object file for x86)
llc --filetype=asm --march=arm dce.ll (Assembly for arm)
llc --debug-pass=Arguments dce.ll (Prints target dependent passes executed)
llc --stop-before=x86-lvi-ret dce.ll (Prints MIR before the specified pass[x86-lvi-ret] to a .s file)
llc --stop-after=x86-lvi-ret dce.ll (Prints MIR after the specified pass[x86-lvi-ret] to a .s file)

============================================= LLVM REFERENCES =============================================

1. http://www.aosabook.org/en/llvm.html
2. http://llvm.org/docs/GettingStarted.html
3. http://llvm.org/docs/CMake.html
4. http://llvm.org/docs/LangRef.html
5. http://llvm.org/docs/Passes.html
6. http://llvm.org/docs/AliasAnalysis.html
7. http://llvm.org/docs/ProgrammersManual.html
8. http://llvm.org/docs/WritingAnLLVMPass.html
9. http://llvm.org/docs/CodingStandards.html
10. http://llvm.org/docs/ExtendingLLVM.html
11. http://llvm.org/docs/MIRLangRef.html
12. http://llvm.org/docs/WritingAnLLVMBackend.html
13. http://llvm.org/docs/
14. http://llvm.org/doxygen/
15. https://www.cs.cmu.edu/afs/cs/academic/class/15745-s13/public/lectures/L6-LLVM-Detail-1up.pdf

