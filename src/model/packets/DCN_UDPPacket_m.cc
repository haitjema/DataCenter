//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/packets/DCN_UDPPacket.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "DCN_UDPPacket_m.h"

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




DCN_UDPPacket_Base::DCN_UDPPacket_Base(const char *name, int kind) : DCN_IPPacket(name,kind)
{
    this->setKind(DCN_UDP_PACKET);
    this->setTransportProtocol(IP_PROT_UDP);
}

DCN_UDPPacket_Base::DCN_UDPPacket_Base(const DCN_UDPPacket_Base& other) : DCN_IPPacket(other)
{
    copy(other);
}

DCN_UDPPacket_Base::~DCN_UDPPacket_Base()
{
}

DCN_UDPPacket_Base& DCN_UDPPacket_Base::operator=(const DCN_UDPPacket_Base& other)
{
    if (this==&other) return *this;
    DCN_IPPacket::operator=(other);
    copy(other);
    return *this;
}

void DCN_UDPPacket_Base::copy(const DCN_UDPPacket_Base& other)
{
}

void DCN_UDPPacket_Base::parsimPack(cCommBuffer *b)
{
    DCN_IPPacket::parsimPack(b);
}

void DCN_UDPPacket_Base::parsimUnpack(cCommBuffer *b)
{
    DCN_IPPacket::parsimUnpack(b);
}

class DCN_UDPPacketDescriptor : public cClassDescriptor
{
  public:
    DCN_UDPPacketDescriptor();
    virtual ~DCN_UDPPacketDescriptor();

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

Register_ClassDescriptor(DCN_UDPPacketDescriptor);

DCN_UDPPacketDescriptor::DCN_UDPPacketDescriptor() : cClassDescriptor("DCN_UDPPacket", "DCN_IPPacket")
{
}

DCN_UDPPacketDescriptor::~DCN_UDPPacketDescriptor()
{
}

bool DCN_UDPPacketDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<DCN_UDPPacket_Base *>(obj)!=NULL;
}

const char *DCN_UDPPacketDescriptor::getProperty(const char *propertyname) const
{
    if (!strcmp(propertyname,"customize")) return "true";
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int DCN_UDPPacketDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 0+basedesc->getFieldCount(object) : 0;
}

unsigned int DCN_UDPPacketDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    return 0;
}

const char *DCN_UDPPacketDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    return NULL;
}

int DCN_UDPPacketDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *DCN_UDPPacketDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    return NULL;
}

const char *DCN_UDPPacketDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        default: return NULL;
    }
}

int DCN_UDPPacketDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    DCN_UDPPacket_Base *pp = (DCN_UDPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string DCN_UDPPacketDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    DCN_UDPPacket_Base *pp = (DCN_UDPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return "";
    }
}

bool DCN_UDPPacketDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    DCN_UDPPacket_Base *pp = (DCN_UDPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return false;
    }
}

const char *DCN_UDPPacketDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    return NULL;
}

void *DCN_UDPPacketDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    DCN_UDPPacket_Base *pp = (DCN_UDPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}


