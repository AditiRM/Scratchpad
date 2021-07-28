
//checker:core.VLASize

void test() {
  int x = 0;
  int vla2[x]; // warn: zero size
}
