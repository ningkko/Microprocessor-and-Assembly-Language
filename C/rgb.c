// hw11a.c
// Ning
// Description can be found in readme/

#include <stdlib.h>
#include <stdio.h>

// definition of a node of the linked list
typedef struct node node_t;
struct node{
  int r, g, b;
  node_t* next;
};


node_t* insertAtFront( node_t *head, int r, int g, int b ) {
  // insert a node at the front of the list
  node_t *p = (node_t *) malloc( sizeof( node_t ) );
  if ( p==NULL ) {
      printf( "Allocation error\n" );
      exit( 1 );
  }
  // store r, g, b values in node
  p->r = r;
  p->g = g;
  p->b = b;

  // attach node to list head
  p->next = head;
  head = p;
  return head;
}

void displayList( node_t* head ) {
  // display complete list, starting with head
  // if head is null (empty list) does not print anything
  node_t *p = head;
  while ( p != NULL ) {
    printf( "%d %d %d\n", p->r, p->g, p->b );
    p = p->next;
  }
}

int findMax( node_t* head, int mode ) {
  // finds the max element in Column 1, 2, or 3.
  // mode indicates which column to look into


  node_t *p = head;
  // find the 3 different max values
  int max1=-1, max2=-1, max3=-1;
  while ( p != NULL ) {
    if (p->r > max1 ) max1 = p->r;
    if (p->g > max2 ) max2 = p->g;
    if (p->b > max3 ) max3 = p->b;
    p = p->next;
  }
  //printf( "max1=%d max2=%d max3=%d\n", max1, max2, max3 );
  
  // count the number of elements in each column
  // equal to the max of each column
  int count1=0, count2=0, count3=0;
  
  p = head;
  while ( p != NULL ) {
    if (p->r == max1 ) count1++;
    if (p->g == max2 ) count2++;
    if (p->b == max3 ) count3++;
    p = p->next;
  }
  //printf( "count1=%d count2=%d count3=%d\n", count1, count2, count3 );
  
  // return the appropriate max
  if ( mode==1 ) return count1;
  if ( mode==2 ) return count2;
  if ( mode==3 ) return count3;
}

int main() {
  node_t *head=NULL;
  int r, g, b, mode;

  // read triplets until a valid sentinel
  // is input
  while ( 1 ) {
    scanf( "%d %d %d", &r, &g, &b );
    getchar();
    if ( r==-1 && g==r && b==r ) {
      mode = 1;
      break;
    }
    if ( r==-2 && g==r && b==r ) {
      mode = 2;
      break;
    }
    if ( r==-3 && g==r && b==r ) {
      mode = 3;
      break;
    }
    if ( r<0 || g<0 || b<0 )
      continue;
    
    head = insertAtFront(head, r, g, b );
  }

  // display the max found in the appropriate column
  printf( "%d\n",  findMax( head, mode ) );
  return 0;
}