
//checker: core.NullDereference

void test(int *p){
  if(!p)
     *p=0;
}
