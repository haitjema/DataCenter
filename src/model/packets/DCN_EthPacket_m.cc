//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/packets/DCN_EthPacket.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "DCN_EthPacket_m.h"

// Template rule which fires if a struct or class doesn't have operator<<
template<typename T>
std::ostream& operator<<(std::ostream& out,const T&) {return out;}

// Another default rule (prevents compiler from choosing base class' doPacking())
template<typename T>
void doPacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doPacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}

template<typename T>
void doUnpacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doUnpacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}




EXECUTE_ON_STARTUP(
    cEnum *e = cEnum::find("DCN_EthPacketType");
    if (!e) enums.getInstance()->add(e = new cEnum("DCN_EthPacketType"));
    e->insert(DCN_ETH_PACKET, "DCN_ETH_PACKET");
    e->insert(DCN_SCHEDULING_PACKET, "DCN_SCHEDULING_PACKET");
    e->insert(DCN_IP_PACKET, "DCN_IP_PACKET");
    e->insert(DCN_UDP_PACKET, "DCN_UDP_PACKET");
    e->insert(DCN_TCP_PACKET, "DCN_TCP_PACKET");
);

DCN_EthPacket_Base::DCN_EthPacket_Base(const char *name, int kind) : cPacket(name,kind)
{
    this->srcAddr_var = 0;
    this->destAddr_var = 0;
    this->sequenceNo_var = 0;
    this->payload_var = 0;
    this->path_var = 0;
    this->kind_var = DCN_ETH_PACKET;
    this->dataPacket_var = true;
}

DCN_EthPacket_Base::DCN_EthPacket_Base(const DCN_EthPacket_Base& other) : cPacket(other)
{
    copy(other);
}

DCN_EthPacket_Base::~DCN_EthPacket_Base()
{
}

DCN_EthPacket_Base& DCN_EthPacket_Base::operator=(const DCN_EthPacket_Base& other)
{
    if (this==&other) return *this;
    cPacket::operator=(other);
    copy(other);
    return *this;
}

void DCN_EthPacket_Base::copy(const DCN_EthPacket_Base& other)
{
    this->srcAddr_var = other.srcAddr_var;
    this->destAddr_var = other.destAddr_var;
    this->sequenceNo_var = other.sequenceNo_var;
    this->payload_var = other.payload_var;
    this->path_var = other.path_var;
    this->kind_var = other.kind_var;
    this->dataPacket_var = other.dataPacket_var;
}

void DCN_EthPacket_Base::parsimPack(cCommBuffer *b)
{
    cPacket::parsimPack(b);
    doPacking(b,this->srcAddr_var);
    doPacking(b,this->destAddr_var);
    doPacking(b,this->sequenceNo_var);
    doPacking(b,this->payload_var);
    doPacking(b,this->path_var);
    doPacking(b,this->kind_var);
    doPacking(b,this->dataPacket_var);
}

void DCN_EthPacket_Base::parsimUnpack(cCommBuffer *b)
{
    cPacket::parsimUnpack(b);
    doUnpacking(b,this->srcAddr_var);
    doUnpacking(b,this->destAddr_var);
    doUnpacking(b,this->sequenceNo_var);
    doUnpacking(b,this->payload_var);
    doUnpacking(b,this->path_var);
    doUnpacking(b,this->kind_var);
    doUnpacking(b,this->dataPacket_var);
}

unsigned int DCN_EthPacket_Base::getSrcAddr() const
{
    return srcAddr_var;
}

void DCN_EthPacket_Base::setSrcAddr(unsigned int srcAddr)
{
    this->srcAddr_var = srcAddr;
}

unsigned int DCN_EthPacket_Base::getDestAddr() const
{
    return destAddr_var;
}

void DCN_EthPacket_Base::setDestAddr(unsigned int destAddr)
{
    this->destAddr_var = destAddr;
}

unsigned int DCN_EthPacket_Base::getSequenceNo() const
{
    return sequenceNo_var;
}

void DCN_EthPacket_Base::setSequenceNo(unsigned int sequenceNo)
{
    this->sequenceNo_var = sequenceNo;
}

unsigned short DCN_EthPacket_Base::getPayload() const
{
    return payload_var;
}

void DCN_EthPacket_Base::setPayload(unsigned short payload)
{
    this->payload_var = payload;
}

unsigned short DCN_EthPacket_Base::getPath() const
{
    return path_var;
}

void DCN_EthPacket_Base::setPath(unsigned short path)
{
    this->path_var = path;
}

unsigned short DCN_EthPacket_Base::getKind() const
{
    return kind_var;
}

void DCN_EthPacket_Base::setKind(unsigned short kind)
{
    this->kind_var = kind;
}

bool DCN_EthPacket_Base::getDataPacket() const
{
    return dataPacket_var;
}

void DCN_EthPacket_Base::setDataPacket(bool dataPacket)
{
    this->dataPacket_var = dataPacket;
}

class DCN_EthPacketDescriptor : public cClassDescriptor
{
  public:
    DCN_EthPacketDescriptor();
    virtual ~DCN_EthPacketDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(DCN_EthPacketDescriptor);

DCN_EthPacketDescriptor::DCN_EthPacketDescriptor() : cClassDescriptor("DCN_EthPacket", "cPacket")
{
}

DCN_EthPacketDescriptor::~DCN_EthPacketDescriptor()
{
}

bool DCN_EthPacketDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<DCN_EthPacket_Base *>(obj)!=NULL;
}

const char *DCN_EthPacketDescriptor::getProperty(const char *propertyname) const
{
    if (!strcmp(propertyname,"customize")) return "true";
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int DCN_EthPacketDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 7+basedesc->getFieldCount(object) : 7;
}

unsigned int DCN_EthPacketDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
    };
    return (field>=0 && field<7) ? fieldTypeFlags[field] : 0;
}

const char *DCN_EthPacketDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "srcAddr",
        "destAddr",
        "sequenceNo",
        "payload",
        "path",
        "kind",
        "dataPacket",
    };
    return (field>=0 && field<7) ? fieldNames[field] : NULL;
}

int DCN_EthPacketDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='s' && strcmp(fieldName, "srcAddr")==0) return base+0;
    if (fieldName[0]=='d' && strcmp(fieldName, "destAddr")==0) return base+1;
    if (fieldName[0]=='s' && strcmp(fieldName, "sequenceNo")==0) return base+2;
    if (fieldName[0]=='p' && strcmp(fieldName, "payload")==0) return base+3;
    if (fieldName[0]=='p' && strcmp(fieldName, "path")==0) return base+4;
    if (fieldName[0]=='k' && strcmp(fieldName, "kind")==0) return base+5;
    if (fieldName[0]=='d' && strcmp(fieldName, "dataPacket")==0) return base+6;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *DCN_EthPacketDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "unsigned int",
        "unsigned int",
        "unsigned int",
        "unsigned short",
        "unsigned short",
        "unsigned short",
        "bool",
    };
    return (field>=0 && field<7) ? fieldTypeStrings[field] : NULL;
}

const char *DCN_EthPacketDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        case 5:
            if (!strcmp(propertyname,"enum")) return "DCN_EthPacketType";
            return NULL;
        default: return NULL;
    }
}

int DCN_EthPacketDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    DCN_EthPacket_Base *pp = (DCN_EthPacket_Base *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string DCN_EthPacketDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    DCN_EthPacket_Base *pp = (DCN_EthPacket_Base *)object; (void)pp;
    switch (field) {
        case 0: return ulong2string(pp->getSrcAddr());
        case 1: return ulong2string(pp->getDestAddr());
        case 2: return ulong2string(pp->getSequenceNo());
        case 3: return ulong2string(pp->getPayload());
        case 4: return ulong2string(pp->getPath());
        case 5: return ulong2string(pp->getKind());
        case 6: return bool2string(pp->getDataPacket());
        default: return "";
    }
}

bool DCN_EthPacketDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    DCN_EthPacket_Base *pp = (DCN_EthPacket_Base *)object; (void)pp;
    switch (field) {
        case 0: pp->setSrcAddr(string2ulong(value)); return true;
        case 1: pp->setDestAddr(string2ulong(value)); return true;
        case 2: pp->setSequenceNo(string2ulong(value)); return true;
        case 3: pp->setPayload(string2ulong(value)); return true;
        case 4: pp->setPath(string2ulong(value)); return true;
        case 5: pp->setKind(string2ulong(value)); return true;
        case 6: pp->setDataPacket(string2bool(value)); return true;
        default: return false;
    }
}

const char *DCN_EthPacketDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
    };
    return (field>=0 && field<7) ? fieldStructNames[field] : NULL;
}

void *DCN_EthPacketDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    DCN_EthPacket_Base *pp = (DCN_EthPacket_Base *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}


