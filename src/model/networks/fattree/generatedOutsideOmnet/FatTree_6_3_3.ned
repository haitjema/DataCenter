package datacenter.model.networks.fattree.generatedOutsideOmnet;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;


network FatTree_6_3_3
{
  parameters:
    **.tree_depth               = 3;
    **.int_switch_down_ports    = 6;
    **.tor_switch_up_ports      = 3;
    **.tor_switch_down_ports    = 3;
    **.switch_up_ports          = 3;
    **.switch_down_ports        = 3;
    **.switch_switch_link_speed = 1 Gbps;
    **.server_switch_link_speed = 1 Gbps;
    **.number_of_paths = 9;
    string ServerType = default("TCPClientServer"); 
   
    @statistic[switchDrop](title="dropped packet byte length";unit=bytes;record=vector,min,max,mean,count,sum;interpolationmode=none);
    @statistic[switchQlenPkts](title="queue length (pkts)";record=vector,timeavg,max;interpolationmode=sample-hold);
    @statistic[serverPortRxBytes](title="received packet byte length";unit=bytes;record=vector,count,sum,mean,min,max;interpolationmode=none);
	@statistic[serverPortTxBytes](title="transmitting packet byte length";unit=bytes;record=vector,count,sum,mean,min,max;interpolationmode=none);
    

  types:
    channel Link_1Gbps extends DatarateChannel
    {
        datarate = 1 Gbps;
    }
    channel Link_10Gbps extends DatarateChannel
    {
        datarate = 10 Gbps;
    }

  submodules:
    Server_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50,650,x");
            address = 0;
        gates:
    }
    Server_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=175,650,x");
            address = 1;
        gates:
    }
    Server_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=300,650,x");
            address = 2;
        gates:
    }
    Switch_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=175,450,x");
            switch_id = "Switch_0_0_i0";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=425,650,x");
            address = 3;
        gates:
    }
    Server_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=550,650,x");
            address = 4;
        gates:
    }
    Server_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=675,650,x");
            address = 5;
        gates:
    }
    Switch_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=550,450,x");
            switch_id = "Switch_0_1_i0";
            depth = 2;
            sub_tree_id = 3;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=800,650,x");
            address = 6;
        gates:
    }
    Server_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=925,650,x");
            address = 7;
        gates:
    }
    Server_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1050,650,x");
            address = 8;
        gates:
    }
    Switch_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=925,450,x");
            switch_id = "Switch_0_2_i0";
            depth = 2;
            sub_tree_id = 6;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=300,250,x");
            switch_id = "Switch_0_i0";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_0_i1 : EthSwitch
    {
        parameters:
            @display("p=550,250,x");
            switch_id = "Switch_0_i1";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_0_i2 : EthSwitch
    {
        parameters:
            @display("p=800,250,x");
            switch_id = "Switch_0_i2";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1175,650,x");
            address = 9;
        gates:
    }
    Server_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1300,650,x");
            address = 10;
        gates:
    }
    Server_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1425,650,x");
            address = 11;
        gates:
    }
    Switch_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1300,450,x");
            switch_id = "Switch_1_0_i0";
            depth = 2;
            sub_tree_id = 9;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1550,650,x");
            address = 12;
        gates:
    }
    Server_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1675,650,x");
            address = 13;
        gates:
    }
    Server_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1800,650,x");
            address = 14;
        gates:
    }
    Switch_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1675,450,x");
            switch_id = "Switch_1_1_i0";
            depth = 2;
            sub_tree_id = 12;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1925,650,x");
            address = 15;
        gates:
    }
    Server_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2050,650,x");
            address = 16;
        gates:
    }
    Server_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2175,650,x");
            address = 17;
        gates:
    }
    Switch_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=2050,450,x");
            switch_id = "Switch_1_2_i0";
            depth = 2;
            sub_tree_id = 15;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1425,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 9;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_1_i1 : EthSwitch
    {
        parameters:
            @display("p=1675,250,x");
            switch_id = "Switch_1_i1";
            depth = 1;
            sub_tree_id = 9;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_1_i2 : EthSwitch
    {
        parameters:
            @display("p=1925,250,x");
            switch_id = "Switch_1_i2";
            depth = 1;
            sub_tree_id = 9;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2300,650,x");
            address = 18;
        gates:
    }
    Server_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2425,650,x");
            address = 19;
        gates:
    }
    Server_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2550,650,x");
            address = 20;
        gates:
    }
    Switch_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2425,450,x");
            switch_id = "Switch_2_0_i0";
            depth = 2;
            sub_tree_id = 18;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2675,650,x");
            address = 21;
        gates:
    }
    Server_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2800,650,x");
            address = 22;
        gates:
    }
    Server_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2925,650,x");
            address = 23;
        gates:
    }
    Switch_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2800,450,x");
            switch_id = "Switch_2_1_i0";
            depth = 2;
            sub_tree_id = 21;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3050,650,x");
            address = 24;
        gates:
    }
    Server_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3175,650,x");
            address = 25;
        gates:
    }
    Server_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=3300,650,x");
            address = 26;
        gates:
    }
    Switch_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=3175,450,x");
            switch_id = "Switch_2_2_i0";
            depth = 2;
            sub_tree_id = 24;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=2550,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 18;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_2_i1 : EthSwitch
    {
        parameters:
            @display("p=2800,250,x");
            switch_id = "Switch_2_i1";
            depth = 1;
            sub_tree_id = 18;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_2_i2 : EthSwitch
    {
        parameters:
            @display("p=3050,250,x");
            switch_id = "Switch_2_i2";
            depth = 1;
            sub_tree_id = 18;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3425,650,x");
            address = 27;
        gates:
    }
    Server_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3550,650,x");
            address = 28;
        gates:
    }
    Server_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=3675,650,x");
            address = 29;
        gates:
    }
    Switch_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=3550,450,x");
            switch_id = "Switch_3_0_i0";
            depth = 2;
            sub_tree_id = 27;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3800,650,x");
            address = 30;
        gates:
    }
    Server_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3925,650,x");
            address = 31;
        gates:
    }
    Server_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4050,650,x");
            address = 32;
        gates:
    }
    Switch_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=3925,450,x");
            switch_id = "Switch_3_1_i0";
            depth = 2;
            sub_tree_id = 30;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4175,650,x");
            address = 33;
        gates:
    }
    Server_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4300,650,x");
            address = 34;
        gates:
    }
    Server_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4425,650,x");
            address = 35;
        gates:
    }
    Switch_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=4300,450,x");
            switch_id = "Switch_3_2_i0";
            depth = 2;
            sub_tree_id = 33;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=3675,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 27;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_3_i1 : EthSwitch
    {
        parameters:
            @display("p=3925,250,x");
            switch_id = "Switch_3_i1";
            depth = 1;
            sub_tree_id = 27;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_3_i2 : EthSwitch
    {
        parameters:
            @display("p=4175,250,x");
            switch_id = "Switch_3_i2";
            depth = 1;
            sub_tree_id = 27;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_4_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4550,650,x");
            address = 36;
        gates:
    }
    Server_4_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4675,650,x");
            address = 37;
        gates:
    }
    Server_4_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4800,650,x");
            address = 38;
        gates:
    }
    Switch_4_0_i0 : EthSwitch
    {
        parameters:
            @display("p=4675,450,x");
            switch_id = "Switch_4_0_i0";
            depth = 2;
            sub_tree_id = 36;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_4_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4925,650,x");
            address = 39;
        gates:
    }
    Server_4_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5050,650,x");
            address = 40;
        gates:
    }
    Server_4_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5175,650,x");
            address = 41;
        gates:
    }
    Switch_4_1_i0 : EthSwitch
    {
        parameters:
            @display("p=5050,450,x");
            switch_id = "Switch_4_1_i0";
            depth = 2;
            sub_tree_id = 39;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_4_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5300,650,x");
            address = 42;
        gates:
    }
    Server_4_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5425,650,x");
            address = 43;
        gates:
    }
    Server_4_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5550,650,x");
            address = 44;
        gates:
    }
    Switch_4_2_i0 : EthSwitch
    {
        parameters:
            @display("p=5425,450,x");
            switch_id = "Switch_4_2_i0";
            depth = 2;
            sub_tree_id = 42;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_4_i0 : EthSwitch
    {
        parameters:
            @display("p=4800,250,x");
            switch_id = "Switch_4_i0";
            depth = 1;
            sub_tree_id = 36;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_4_i1 : EthSwitch
    {
        parameters:
            @display("p=5050,250,x");
            switch_id = "Switch_4_i1";
            depth = 1;
            sub_tree_id = 36;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_4_i2 : EthSwitch
    {
        parameters:
            @display("p=5300,250,x");
            switch_id = "Switch_4_i2";
            depth = 1;
            sub_tree_id = 36;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_5_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5675,650,x");
            address = 45;
        gates:
    }
    Server_5_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5800,650,x");
            address = 46;
        gates:
    }
    Server_5_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5925,650,x");
            address = 47;
        gates:
    }
    Switch_5_0_i0 : EthSwitch
    {
        parameters:
            @display("p=5800,450,x");
            switch_id = "Switch_5_0_i0";
            depth = 2;
            sub_tree_id = 45;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_5_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6050,650,x");
            address = 48;
        gates:
    }
    Server_5_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6175,650,x");
            address = 49;
        gates:
    }
    Server_5_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=6300,650,x");
            address = 50;
        gates:
    }
    Switch_5_1_i0 : EthSwitch
    {
        parameters:
            @display("p=6175,450,x");
            switch_id = "Switch_5_1_i0";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[3];
            up_port[3];
    }
    Server_5_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6425,650,x");
            address = 51;
        gates:
    }
    Server_5_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6550,650,x");
            address = 52;
        gates:
    }
    Server_5_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=6675,650,x");
            address = 53;
        gates:
    }
    Switch_5_2_i0 : EthSwitch
    {
        parameters:
            @display("p=6550,450,x");
            switch_id = "Switch_5_2_i0";
            depth = 2;
            sub_tree_id = 51;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_5_i0 : EthSwitch
    {
        parameters:
            @display("p=5925,250,x");
            switch_id = "Switch_5_i0";
            depth = 1;
            sub_tree_id = 45;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_5_i1 : EthSwitch
    {
        parameters:
            @display("p=6175,250,x");
            switch_id = "Switch_5_i1";
            depth = 1;
            sub_tree_id = 45;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_5_i2 : EthSwitch
    {
        parameters:
            @display("p=6425,250,x");
            switch_id = "Switch_5_i2";
            depth = 1;
            sub_tree_id = 45;
        gates:
            down_port[3];
            up_port[3];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=712,50,x");
            switch_id = "Switch_i0";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }
    Switch_i1 : EthSwitch
    {
        parameters:
            @display("p=1374,50,x");
            switch_id = "Switch_i1";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }
    Switch_i2 : EthSwitch
    {
        parameters:
            @display("p=2036,50,x");
            switch_id = "Switch_i2";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }
    Switch_i3 : EthSwitch
    {
        parameters:
            @display("p=2698,50,x");
            switch_id = "Switch_i3";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }
    Switch_i4 : EthSwitch
    {
        parameters:
            @display("p=3360,50,x");
            switch_id = "Switch_i4";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }
    Switch_i5 : EthSwitch
    {
        parameters:
            @display("p=4022,50,x");
            switch_id = "Switch_i5";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }
    Switch_i6 : EthSwitch
    {
        parameters:
            @display("p=4684,50,x");
            switch_id = "Switch_i6";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }
    Switch_i7 : EthSwitch
    {
        parameters:
            @display("p=5346,50,x");
            switch_id = "Switch_i7";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }
    Switch_i8 : EthSwitch
    {
        parameters:
            @display("p=6008,50,x");
            switch_id = "Switch_i8";
            depth = 0;
            sub_tree_id = 1606415264;
        gates:
            down_port[6];
            up_port[0];
    }

    connections:
     Switch_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_0.port;
     Switch_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_1.port;
     Switch_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_0_0_2.port;
     Switch_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_0.port;
     Switch_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_1.port;
     Switch_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_0_1_2.port;
     Switch_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_0_2_0.port;
     Switch_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_0_2_1.port;
     Switch_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_0_2_2.port;
     Switch_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[0];
     Switch_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[0];
     Switch_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[1];
     Switch_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[1];
     Switch_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[1];
     Switch_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[2];
     Switch_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[2];
     Switch_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[2];
     Switch_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_0.port;
     Switch_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_1.port;
     Switch_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_1_0_2.port;
     Switch_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_0.port;
     Switch_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_1.port;
     Switch_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_1_1_2.port;
     Switch_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_1_2_0.port;
     Switch_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_1_2_1.port;
     Switch_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_1_2_2.port;
     Switch_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[0];
     Switch_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[0];
     Switch_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[1];
     Switch_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[1];
     Switch_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[1];
     Switch_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[2];
     Switch_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[2];
     Switch_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[2];
     Switch_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_0.port;
     Switch_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_1.port;
     Switch_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_2_0_2.port;
     Switch_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_0.port;
     Switch_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_1.port;
     Switch_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_2_1_2.port;
     Switch_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_2_2_0.port;
     Switch_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_2_2_1.port;
     Switch_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_2_2_2.port;
     Switch_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[0];
     Switch_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[0];
     Switch_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[1];
     Switch_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[1];
     Switch_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[1];
     Switch_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[2];
     Switch_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[2];
     Switch_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[2];
     Switch_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_0.port;
     Switch_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_1.port;
     Switch_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_3_0_2.port;
     Switch_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_0.port;
     Switch_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_1.port;
     Switch_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_3_1_2.port;
     Switch_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_3_2_0.port;
     Switch_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_3_2_1.port;
     Switch_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_3_2_2.port;
     Switch_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[0];
     Switch_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[0];
     Switch_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[1];
     Switch_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[1];
     Switch_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[1];
     Switch_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[2];
     Switch_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[2];
     Switch_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[2];
     Switch_4_0_i0.down_port[0] <--> Link_1Gbps <--> Server_4_0_0.port;
     Switch_4_0_i0.down_port[1] <--> Link_1Gbps <--> Server_4_0_1.port;
     Switch_4_0_i0.down_port[2] <--> Link_1Gbps <--> Server_4_0_2.port;
     Switch_4_1_i0.down_port[0] <--> Link_1Gbps <--> Server_4_1_0.port;
     Switch_4_1_i0.down_port[1] <--> Link_1Gbps <--> Server_4_1_1.port;
     Switch_4_1_i0.down_port[2] <--> Link_1Gbps <--> Server_4_1_2.port;
     Switch_4_2_i0.down_port[0] <--> Link_1Gbps <--> Server_4_2_0.port;
     Switch_4_2_i0.down_port[1] <--> Link_1Gbps <--> Server_4_2_1.port;
     Switch_4_2_i0.down_port[2] <--> Link_1Gbps <--> Server_4_2_2.port;
     Switch_4_i0.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[0];
     Switch_4_i0.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[0];
     Switch_4_i0.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[0];
     Switch_4_i1.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[1];
     Switch_4_i1.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[1];
     Switch_4_i1.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[1];
     Switch_4_i2.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[2];
     Switch_4_i2.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[2];
     Switch_4_i2.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[2];
     Switch_5_0_i0.down_port[0] <--> Link_1Gbps <--> Server_5_0_0.port;
     Switch_5_0_i0.down_port[1] <--> Link_1Gbps <--> Server_5_0_1.port;
     Switch_5_0_i0.down_port[2] <--> Link_1Gbps <--> Server_5_0_2.port;
     Switch_5_1_i0.down_port[0] <--> Link_1Gbps <--> Server_5_1_0.port;
     Switch_5_1_i0.down_port[1] <--> Link_1Gbps <--> Server_5_1_1.port;
     Switch_5_1_i0.down_port[2] <--> Link_1Gbps <--> Server_5_1_2.port;
     Switch_5_2_i0.down_port[0] <--> Link_1Gbps <--> Server_5_2_0.port;
     Switch_5_2_i0.down_port[1] <--> Link_1Gbps <--> Server_5_2_1.port;
     Switch_5_2_i0.down_port[2] <--> Link_1Gbps <--> Server_5_2_2.port;
     Switch_5_i0.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[0];
     Switch_5_i0.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[0];
     Switch_5_i0.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[0];
     Switch_5_i1.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[1];
     Switch_5_i1.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[1];
     Switch_5_i1.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[1];
     Switch_5_i2.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[2];
     Switch_5_i2.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[2];
     Switch_5_i2.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[2];
     Switch_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[0];
     Switch_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[0];
     Switch_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[0];
     Switch_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[0];
     Switch_i0.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[0];
     Switch_i0.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[0];
     Switch_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[1];
     Switch_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[1];
     Switch_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[1];
     Switch_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[1];
     Switch_i1.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[1];
     Switch_i1.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[1];
     Switch_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[2];
     Switch_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[2];
     Switch_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[2];
     Switch_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[2];
     Switch_i2.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[2];
     Switch_i2.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[2];
     Switch_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[0];
     Switch_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[0];
     Switch_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[0];
     Switch_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[0];
     Switch_i3.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[0];
     Switch_i3.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[0];
     Switch_i4.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[1];
     Switch_i4.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[1];
     Switch_i4.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[1];
     Switch_i4.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[1];
     Switch_i4.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[1];
     Switch_i4.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[1];
     Switch_i5.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[2];
     Switch_i5.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[2];
     Switch_i5.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[2];
     Switch_i5.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[2];
     Switch_i5.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[2];
     Switch_i5.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[2];
     Switch_i6.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[0];
     Switch_i6.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[0];
     Switch_i6.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[0];
     Switch_i6.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[0];
     Switch_i6.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[0];
     Switch_i6.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[0];
     Switch_i7.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[1];
     Switch_i7.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[1];
     Switch_i7.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[1];
     Switch_i7.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[1];
     Switch_i7.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[1];
     Switch_i7.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[1];
     Switch_i8.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[2];
     Switch_i8.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[2];
     Switch_i8.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[2];
     Switch_i8.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[2];
     Switch_i8.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[2];
     Switch_i8.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[2];
}
