//clang++ -O1 -g -fsanitize=address addrsan-example.cpp

int main(int argc, char **argv) {
  int stack_array[100];
  stack_array[1] = 0;
  return stack_array[argc + 100];
}