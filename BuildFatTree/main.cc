#include "../src/model/common/std_includes.h"
#include "../src/model/common/node_id.h"
#include "ethernet_node.h"
#include "ethernet_switch.h"
#include "fat_tree.h"


void print_usage(char *name)
{
	cout << "Usage: " << name << ": <m> <n>\n";
	cout << "Builds an OMNet++ NED file to represent the FatTree(m,n).\n";
	cout << "m = # ports per switch (m must be a power of 2)\n";
	cout << "n = # of levels in FatTree (e.g. N = 3 means 3 layers of switches + hosts)\n";
    cout << "\nThe -l option can be used to create the equivalent logical tree instead.\n\n";
}

int main(int argc, char* argv[])
{
	uint m; uint n; uint lflag = 0;

    int c; opterr = 0;
    while ((c = getopt (argc, argv, "l")) != -1){
        switch (c) {
            case 'l':
                lflag = 1;
                break;
            case '?':
                if (isprint (optopt)) {
                    fprintf (stderr, "Unknown option `-%c'.\n", optopt);
                } else {
                    fprintf (stderr, "Unknown option character `\\x%x'.\n", optopt);
                    return 1;
                }
            default:
                abort();
        }
    }
    
    if (argc - optind != 2) {
        print_usage(argv[0]);
        return 1;
    } else {
		m = (uint)atoi(argv[argc-2]);
		n = (uint)atoi(argv[argc-1]);
    }
    
	BuildFatTreeParameters p;
	p.int_switch_down_ports = m;
	//p.int_switches = 4; // XXX
	p.tor_switch_down_ports = m/2;
	p.switch_down_ports = m/2;
	if (lflag) {
	    p.switch_up_ports = 1;    
    	p.tor_switch_up_ports = 1;
	} else {
	    p.switch_up_ports = m/2;    
    	p.tor_switch_up_ports = m/2;
	}
	p.tree_depth = n;
	p.server_switch_link_speed = 1*GBPS;
	p.switch_switch_link_speed = 1*GBPS;

    log << "m = "  << m << " n = " << n << " logical tree = " << lflag << endl;
    log << "Constructing tree...\n\n\n";
    SubFatTree *t = NULL;
    if (lflag) {
        t = new LogicalTree(p);
    } else {
        t = new FatTree(p);
    }
    t->Init(); // Construct the FatTree
    t->PrintNed(50); // 50 is the display offset from the left edge of the screen    
    delete t;
    
	return 0;
}

