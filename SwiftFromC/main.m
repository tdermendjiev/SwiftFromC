//
//  main.m
//  SwiftFromC
//
//  Created by Dermendzhiev, Teodor (external - Project) on 27.05.22.
//

#import <Foundation/Foundation.h>
#include <dlfcn.h>
#include <ffi.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ffi_type* args[] = {&ffi_type_double};
        
        ffi_cif cif;
        ffi_status status = ffi_prep_cif(&cif, FFI_DEFAULT_ABI, 1, &ffi_type_sint64,
                                         args);
        if (status != FFI_OK) {
            fprintf(stderr, "ffi_prep_cif error: %d\n", status);
            exit(1);
        }
        
        void* fun = dlsym(RTLD_DEFAULT, "$s10SwiftFromC10helloWorld5paramSiSd_tF");
        int result;
        double param = 124.5;
        void* values[] = {&param};
        ffi_call(&cif, FFI_FN(fun), &result, &values);
        printf("Result is: %d\n", result);
        
    }
    return 0;
}
