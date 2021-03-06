//
//  XLClassInfo.h
//  Study
//
//  Created by 孟宪亮 on 2021/8/21.
//

#import <Foundation/Foundation.h>

#ifndef MJClassInfo_h
#define MJClassInfo_h

# if __arm64__
#   define ISA_MASK        0x0000000ffffffff8ULL
# elif __x86_64__
#   define ISA_MASK        0x00007ffffffffff8ULL
# endif

#if __LP64__
typedef uint32_t mask_t;
#else
typedef uint16_t mask_t;
#endif
typedef uintptr_t cache_key_t;

struct bucket_t {
    cache_key_t _key;
    IMP _imp;
};

struct cache_t {
    bucket_t *_buckets;
    mask_t _mask;
    mask_t _occupied;
};

struct entsize_list_tt {
    uint32_t entsizeAndFlags;
    uint32_t count;
};

struct method_t {
    SEL name;
    const char *types;
    IMP imp;
};

struct method_list_t : entsize_list_tt {
    method_t first;
};

template <typename Element, typename List, template<typename> class Ptr>
class list_array_tt {
    struct array_t {
        uint32_t count;
        Ptr<List> lists[0];

        static size_t byteSize(uint32_t count) {
            return sizeof(array_t) + count*sizeof(lists[0]);
        }
        size_t byteSize() {
            return byteSize(count);
        }
    };
};

//class method_array_t: public list_array_tt<method_t, method_list_t> {
//
//};



//class method_array_t :
//    public list_array_tt<method_t, method_list_t, method_list_t_authed_ptr>
//{
//    typedef list_array_tt<method_t, method_list_t, method_list_t_authed_ptr> Super;
//};

struct ivar_t {
    int32_t *offset;
    const char *name;
    const char *type;
    uint32_t alignment_raw;
    uint32_t size;
};

struct ivar_list_t : entsize_list_tt {
    ivar_t first;
};

struct property_t {
    const char *name;
    const char *attributes;
};

struct property_list_t : entsize_list_tt {
    property_t first;
};

struct chained_property_list {
    chained_property_list *next;
    uint32_t count;
    property_t list[0];
};

typedef uintptr_t protocol_ref_t;
struct protocol_list_t {
    uintptr_t count;
    protocol_ref_t list[0];
};

struct class_ro_t {
    uint32_t flags;
    uint32_t instanceStart;
    uint32_t instanceSize;  // instance对象占用的内存空间
#ifdef __LP64__
    uint32_t reserved;
#endif
    const uint8_t * ivarLayout;
    const char * name;  // 类名
    method_list_t * baseMethodList;
    protocol_list_t * baseProtocols;
    const ivar_list_t * ivars;  // 成员变量列表
    const uint8_t * weakIvarLayout;
    property_list_t *baseProperties;
};

//struct class_rw_t {
//    uint32_t flags;
//    uint32_t version;
//    const class_ro_t *ro;
//    method_list_t * methods;    // 方法列表
//    property_list_t *properties;    // 属性列表
//    const protocol_list_t * protocols;  // 协议列表
//    Class firstSubclass;
//    Class nextSiblingClass;
//    char *demangledName;
//};

struct class_rw_t {
    uint32_t flags;
    uint16_t witness;
    const class_ro_t *ro;
    const list_array_tt* methods; // 方法列表
//    const property_array_t properties; // 属性列表
//    const protocol_array_t protocols; // 协议列表
};


#define FAST_DATA_MASK          0x00007ffffffffff8UL
struct class_data_bits_t {
    uintptr_t bits;
public:
    class_rw_t* data() {
        return (class_rw_t *)(bits & FAST_DATA_MASK);
    }
};

/* OC对象 */
struct mj_objc_object {
    void *isa;
};

/* 类对象 */
struct mj_objc_class : mj_objc_object {
    Class superclass;
    cache_t cache; // 方法缓存
    class_data_bits_t bits; // 用于获取具体类的信息
public:
    class_rw_t* data() {
        return bits.data();
    }
    
    mj_objc_class* metaClass() {
        return (mj_objc_class *)((long long)isa & ISA_MASK);
    }
};

#endif /* MJClassInfo_h */
