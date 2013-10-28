//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/packets/DCN_IPPacket.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "DCN_IPPacket_m.h"

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




DCN_IPPacket_Base::DCN_IPPacket_Base(const char *name, int kind) : DCN_EthPacket(name,kind)
{
    this->setKind(DCN_IP_PACKET);

    this->transportProtocol_var = IP_PROT_NONE;
}

DCN_IPPacket_Base::DCN_IPPacket_Base(const DCN_IPPacket_Base& other) : DCN_EthPacket(other)
{
    copy(other);
}

DCN_IPPacket_Base::~DCN_IPPacket_Base()
{
}

DCN_IPPacket_Base& DCN_IPPacket_Base::operator=(const DCN_IPPacket_Base& other)
{
    if (this==&other) return *this;
    DCN_EthPacket::operator=(other);
    copy(other);
    return *this;
}

void DCN_IPPacket_Base::copy(const DCN_IPPacket_Base& other)
{
    this->transportProtocol_var = other.transportProtocol_var;
}

void DCN_IPPacket_Base::parsimPack(cCommBuffer *b)
{
    DCN_EthPacket::parsimPack(b);
    doPacking(b,this->transportProtocol_var);
}

void DCN_IPPacket_Base::parsimUnpack(cCommBuffer *b)
{
    DCN_EthPacket::parsimUnpack(b);
    doUnpacking(b,this->transportProtocol_var);
}

unsigned short DCN_IPPacket_Base::getTransportProtocol() const
{
    return transportProtocol_var;
}

void DCN_IPPacket_Base::setTransportProtocol(unsigned short transportProtocol)
{
    this->transportProtocol_var = transportProtocol;
}

class DCN_IPPacketDescriptor : public cClassDescriptor
{
  public:
    DCN_IPPacketDescriptor();
    virtual ~DCN_IPPacketDescriptor();

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

Register_ClassDescriptor(DCN_IPPacketDescriptor);

DCN_IPPacketDescriptor::DCN_IPPacketDescriptor() : cClassDescriptor("DCN_IPPacket", "DCN_EthPacket")
{
}

DCN_IPPacketDescriptor::~DCN_IPPacketDescriptor()
{
}

bool DCN_IPPacketDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<DCN_IPPacket_Base *>(obj)!=NULL;
}

const char *DCN_IPPacketDescriptor::getProperty(const char *propertyname) const
{
    if (!strcmp(propertyname,"customize")) return "true";
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int DCN_IPPacketDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 1+basedesc->getFieldCount(object) : 1;
}

unsigned int DCN_IPPacketDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
    };
    return (field>=0 && field<1) ? fieldTypeFlags[field] : 0;
}

const char *DCN_IPPacketDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "transportProtocol",
    };
    return (field>=0 && field<1) ? fieldNames[field] : NULL;
}

int DCN_IPPacketDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='t' && strcmp(fieldName, "transportProtocol")==0) return base+0;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *DCN_IPPacketDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "unsigned short",
    };
    return (field>=0 && field<1) ? fieldTypeStrings[field] : NULL;
}

const char *DCN_IPPacketDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        case 0:
            if (!strcmp(propertyname,"enum")) return "IPProtocolId";
            return NULL;
        default: return NULL;
    }
}

int DCN_IPPacketDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    DCN_IPPacket_Base *pp = (DCN_IPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string DCN_IPPacketDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    DCN_IPPacket_Base *pp = (DCN_IPPacket_Base *)object; (void)pp;
    switch (field) {
        case 0: return ulong2string(pp->getTransportProtocol());
        default: return "";
    }
}

bool DCN_IPPacketDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    DCN_IPPacket_Base *pp = (DCN_IPPacket_Base *)object; (void)pp;
    switch (field) {
        case 0: pp->setTransportProtocol(string2ulong(value)); return true;
        default: return false;
    }
}

const char *DCN_IPPacketDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
    };
    return (field>=0 && field<1) ? fieldStructNames[field] : NULL;
}

void *DCN_IPPacketDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    DCN_IPPacket_Base *pp = (DCN_IPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}


