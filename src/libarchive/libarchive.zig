// @link "../deps/libarchive.a"

const lib = @import("./libarchive-bindings.zig");
usingnamespace @import("../global.zig");
const std = @import("std");
const struct_archive = lib.struct_archive;
pub const Seek = enum(c_int) {
    set = std.os.SEEK_SET,
    current = std.os.SEEK_CUR,
    end = std.os.SEEK_END,
};

pub const Flags = struct {
    pub const Extract = enum(c_int) {
        owner = lib.ARCHIVE_EXTRACT_OWNER,
        perm = lib.ARCHIVE_EXTRACT_PERM,
        time = lib.ARCHIVE_EXTRACT_TIME,
        no_overwrite = lib.ARCHIVE_EXTRACT_NO_OVERWRITE,
        unlink = lib.ARCHIVE_EXTRACT_UNLINK,
        acl = lib.ARCHIVE_EXTRACT_ACL,
        fflags = lib.ARCHIVE_EXTRACT_FFLAGS,
        xattr = lib.ARCHIVE_EXTRACT_XATTR,
        secure_symlinks = lib.ARCHIVE_EXTRACT_SECURE_SYMLINKS,
        secure_nodotdot = lib.ARCHIVE_EXTRACT_SECURE_NODOTDOT,
        no_autodir = lib.ARCHIVE_EXTRACT_NO_AUTODIR,
        no_overwrite_newer = lib.ARCHIVE_EXTRACT_NO_OVERWRITE_NEWER,
        sparse = lib.ARCHIVE_EXTRACT_SPARSE,
        mac_metadata = lib.ARCHIVE_EXTRACT_MAC_METADATA,
        no_hfs_compression = lib.ARCHIVE_EXTRACT_NO_HFS_COMPRESSION,
        hfs_compression_forced = lib.ARCHIVE_EXTRACT_HFS_COMPRESSION_FORCED,
        secure_noabsolutepaths = lib.ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS,
        clear_nochange_fflags = lib.ARCHIVE_EXTRACT_CLEAR_NOCHANGE_FFLAGS,
        safe_writes = lib.ARCHIVE_EXTRACT_SAFE_WRITES,
    };

    pub const Compression = enum(c_int) {
        none = lib.ARCHIVE_COMPRESSION_NONE,
        gzip = lib.ARCHIVE_COMPRESSION_GZIP,
        bzip2 = lib.ARCHIVE_COMPRESSION_BZIP2,
        compress = lib.ARCHIVE_COMPRESSION_COMPRESS,
        program = lib.ARCHIVE_COMPRESSION_PROGRAM,
        lzma = lib.ARCHIVE_COMPRESSION_LZMA,
        xz = lib.ARCHIVE_COMPRESSION_XZ,
        uu = lib.ARCHIVE_COMPRESSION_UU,
        rpm = lib.ARCHIVE_COMPRESSION_RPM,
        lzip = lib.ARCHIVE_COMPRESSION_LZIP,
        lrzip = lib.ARCHIVE_COMPRESSION_LRZIP,
    };

    pub const Format = enum(c_int) {
        base_mask = lib.ARCHIVE_FORMAT_BASE_MASK,
        cpio = lib.ARCHIVE_FORMAT_CPIO,
        cpio_posix = lib.ARCHIVE_FORMAT_CPIO_POSIX,
        cpio_bin_le = lib.ARCHIVE_FORMAT_CPIO_BIN_LE,
        cpio_bin_be = lib.ARCHIVE_FORMAT_CPIO_BIN_BE,
        cpio_svr4_nocrc = lib.ARCHIVE_FORMAT_CPIO_SVR4_NOCRC,
        cpio_svr4_crc = lib.ARCHIVE_FORMAT_CPIO_SVR4_CRC,
        cpio_afio_large = lib.ARCHIVE_FORMAT_CPIO_AFIO_LARGE,
        cpio_pwb = lib.ARCHIVE_FORMAT_CPIO_PWB,
        shar = lib.ARCHIVE_FORMAT_SHAR,
        shar_base = lib.ARCHIVE_FORMAT_SHAR_BASE,
        shar_dump = lib.ARCHIVE_FORMAT_SHAR_DUMP,
        tar = lib.ARCHIVE_FORMAT_TAR,
        tar_ustar = lib.ARCHIVE_FORMAT_TAR_USTAR,
        tar_pax_interchange = lib.ARCHIVE_FORMAT_TAR_PAX_INTERCHANGE,
        tar_pax_restricted = lib.ARCHIVE_FORMAT_TAR_PAX_RESTRICTED,
        tar_gnutar = lib.ARCHIVE_FORMAT_TAR_GNUTAR,
        iso9660 = lib.ARCHIVE_FORMAT_ISO9660,
        iso9660_rockridge = lib.ARCHIVE_FORMAT_ISO9660_ROCKRIDGE,
        zip = lib.ARCHIVE_FORMAT_ZIP,
        empty = lib.ARCHIVE_FORMAT_EMPTY,
        ar = lib.ARCHIVE_FORMAT_AR,
        ar_gnu = lib.ARCHIVE_FORMAT_AR_GNU,
        ar_bsd = lib.ARCHIVE_FORMAT_AR_BSD,
        mtree = lib.ARCHIVE_FORMAT_MTREE,
        raw = lib.ARCHIVE_FORMAT_RAW,
        xar = lib.ARCHIVE_FORMAT_XAR,
        lha = lib.ARCHIVE_FORMAT_LHA,
        cab = lib.ARCHIVE_FORMAT_CAB,
        rar = lib.ARCHIVE_FORMAT_RAR,
        @"7zip" = lib.ARCHIVE_FORMAT_7ZIP,
        warc = lib.ARCHIVE_FORMAT_WARC,
        rar_v5 = lib.ARCHIVE_FORMAT_RAR_V5,
    };

    pub const Filter = enum(c_int) {
        none = lib.ARCHIVE_FILTER_NONE,
        gzip = lib.ARCHIVE_FILTER_GZIP,
        bzip2 = lib.ARCHIVE_FILTER_BZIP2,
        compress = lib.ARCHIVE_FILTER_COMPRESS,
        program = lib.ARCHIVE_FILTER_PROGRAM,
        lzma = lib.ARCHIVE_FILTER_LZMA,
        xz = lib.ARCHIVE_FILTER_XZ,
        uu = lib.ARCHIVE_FILTER_UU,
        rpm = lib.ARCHIVE_FILTER_RPM,
        lzip = lib.ARCHIVE_FILTER_LZIP,
        lrzip = lib.ARCHIVE_FILTER_LRZIP,
        lzop = lib.ARCHIVE_FILTER_LZOP,
        grzip = lib.ARCHIVE_FILTER_GRZIP,
        lz4 = lib.ARCHIVE_FILTER_LZ4,
        zstd = lib.ARCHIVE_FILTER_ZSTD,
    };

    pub const EntryDigest = enum(c_int) {
        md5 = lib.ARCHIVE_ENTRY_DIGEST_MD5,
        rmd160 = lib.ARCHIVE_ENTRY_DIGEST_RMD160,
        sha1 = lib.ARCHIVE_ENTRY_DIGEST_SHA1,
        sha256 = lib.ARCHIVE_ENTRY_DIGEST_SHA256,
        sha384 = lib.ARCHIVE_ENTRY_DIGEST_SHA384,
        sha512 = lib.ARCHIVE_ENTRY_DIGEST_SHA512,
    };

    pub const EntryACL = enum(c_int) {
        entry_acl_execute = lib.ARCHIVE_ENTRY_ACL_EXECUTE,
        write = lib.ARCHIVE_ENTRY_ACL_WRITE,
        read = lib.ARCHIVE_ENTRY_ACL_READ,
        read_data = lib.ARCHIVE_ENTRY_ACL_READ_DATA,
        list_directory = lib.ARCHIVE_ENTRY_ACL_LIST_DIRECTORY,
        write_data = lib.ARCHIVE_ENTRY_ACL_WRITE_DATA,
        add_file = lib.ARCHIVE_ENTRY_ACL_ADD_FILE,
        append_data = lib.ARCHIVE_ENTRY_ACL_APPEND_DATA,
        add_subdirectory = lib.ARCHIVE_ENTRY_ACL_ADD_SUBDIRECTORY,
        read_named_attrs = lib.ARCHIVE_ENTRY_ACL_READ_NAMED_ATTRS,
        write_named_attrs = lib.ARCHIVE_ENTRY_ACL_WRITE_NAMED_ATTRS,
        delete_child = lib.ARCHIVE_ENTRY_ACL_DELETE_CHILD,
        read_attributes = lib.ARCHIVE_ENTRY_ACL_READ_ATTRIBUTES,
        write_attributes = lib.ARCHIVE_ENTRY_ACL_WRITE_ATTRIBUTES,
        delete = lib.ARCHIVE_ENTRY_ACL_DELETE,
        read_acl = lib.ARCHIVE_ENTRY_ACL_READ_ACL,
        write_acl = lib.ARCHIVE_ENTRY_ACL_WRITE_ACL,
        write_owner = lib.ARCHIVE_ENTRY_ACL_WRITE_OWNER,
        synchronize = lib.ARCHIVE_ENTRY_ACL_SYNCHRONIZE,
        perms_posix1_e = lib.ARCHIVE_ENTRY_ACL_PERMS_POSIX1E,
        perms_nfs4 = lib.ARCHIVE_ENTRY_ACL_PERMS_NFS4,
        entry_inherited = lib.ARCHIVE_ENTRY_ACL_ENTRY_INHERITED,
        entry_file_inherit = lib.ARCHIVE_ENTRY_ACL_ENTRY_FILE_INHERIT,
        entry_directory_inherit = lib.ARCHIVE_ENTRY_ACL_ENTRY_DIRECTORY_INHERIT,
        entry_no_propagate_inherit = lib.ARCHIVE_ENTRY_ACL_ENTRY_NO_PROPAGATE_INHERIT,
        entry_inherit_only = lib.ARCHIVE_ENTRY_ACL_ENTRY_INHERIT_ONLY,
        entry_successful_access = lib.ARCHIVE_ENTRY_ACL_ENTRY_SUCCESSFUL_ACCESS,
        entry_failed_access = lib.ARCHIVE_ENTRY_ACL_ENTRY_FAILED_ACCESS,
        inheritance_nfs4 = lib.ARCHIVE_ENTRY_ACL_INHERITANCE_NFS4,
        type_access = lib.ARCHIVE_ENTRY_ACL_TYPE_ACCESS,
        type_default = lib.ARCHIVE_ENTRY_ACL_TYPE_DEFAULT,
        type_allow = lib.ARCHIVE_ENTRY_ACL_TYPE_ALLOW,
        type_deny = lib.ARCHIVE_ENTRY_ACL_TYPE_DENY,
        type_audit = lib.ARCHIVE_ENTRY_ACL_TYPE_AUDIT,
        type_alarm = lib.ARCHIVE_ENTRY_ACL_TYPE_ALARM,
        type_posix1_e = lib.ARCHIVE_ENTRY_ACL_TYPE_POSIX1E,
        type_nfs4 = lib.ARCHIVE_ENTRY_ACL_TYPE_NFS4,
        user = lib.ARCHIVE_ENTRY_ACL_USER,
        user_obj = lib.ARCHIVE_ENTRY_ACL_USER_OBJ,
        group = lib.ARCHIVE_ENTRY_ACL_GROUP,
        group_obj = lib.ARCHIVE_ENTRY_ACL_GROUP_OBJ,
        mask = lib.ARCHIVE_ENTRY_ACL_MASK,
        other = lib.ARCHIVE_ENTRY_ACL_OTHER,
        everyone = lib.ARCHIVE_ENTRY_ACL_EVERYONE,
        style_extra_id = lib.ARCHIVE_ENTRY_ACL_STYLE_EXTRA_ID,
        style_mark_default = lib.ARCHIVE_ENTRY_ACL_STYLE_MARK_DEFAULT,
        style_solaris = lib.ARCHIVE_ENTRY_ACL_STYLE_SOLARIS,
        style_separator_comma = lib.ARCHIVE_ENTRY_ACL_STYLE_SEPARATOR_COMMA,
        style_compact = lib.ARCHIVE_ENTRY_ACL_STYLE_COMPACT,
    };
};

pub const Status = enum(c_int) {
    eof = lib.ARCHIVE_EOF,
    ok = lib.ARCHIVE_OK,
    retry = lib.ARCHIVE_RETRY,
    warn = lib.ARCHIVE_WARN,
    failed = lib.ARCHIVE_FAILED,
    fatal = lib.ARCHIVE_FATAL,
};

pub fn NewStream(comptime SeekableStream: type) type {
    return struct {
        const Stream = @This();
        source: SeekableStream,

        pub inline fn fromCtx(ctx: *c_void) *Stream {
            return @ptrCast(*Stream, @alignCast(@alignOf(*Stream), ctx));
        }

        pub fn archive_read_callback(
            archive: *struct_archive,
            ctx_: *c_void,
            buffer: [*c]*const c_void,
        ) callconv(.C) lib.la_ssize_t {
            var this = fromCtx(ctx_);
        }

        pub fn archive_skip_callback(
            archive: *struct_archive,
            ctx_: *c_void,
            offset: lib.la_int64_,
        ) callconv(.C) lib.la_int64_t {
            var this = fromCtx(ctx_);
        }

        pub fn archive_seek_callback(
            archive: *struct_archive,
            ctx_: *c_void,
            offset: lib.la_int64_t,
            whence: c_int,
        ) callconv(.C) lib.la_int64_t {
            var this = fromCtx(ctx_);
        }

        pub fn archive_write_callback(
            archive: *struct_archive,
            ctx_: *c_void,
            buffer: *const c_void,
            len: usize,
        ) callconv(.C) lib.la_ssize_t {
            var this = fromCtx(ctx_);
        }
        pub fn archive_open_callback(
            archive: *struct_archive,
            ctx_: *c_void,
        ) callconv(.C) c_int {
            var this = fromCtx(ctx_);
        }

        pub fn archive_close_callback(
            archive: *struct_archive,
            ctx_: *c_void,
        ) callconv(.C) c_int {
            var this = fromCtx(ctx_);
        }
        pub fn archive_free_callback(
            archive: *struct_archive,
            ctx_: *c_void,
        ) callconv(.C) c_int {
            var this = fromCtx(ctx_);
        }

        pub fn archive_switch_callback(
            archive: *struct_archive,
            ctx1: *c_void,
            ctx2: *c_void,
        ) callconv(.C) c_int {
            var this = fromCtx(ctx1);
            var that = fromCtx(ctx2);
        }
    };
}

pub const BufferReadStream = struct {
    const Stream = @This();
    buf: []const u8,
    pos: usize = 0,

    block_size: usize = 16384,

    archive: *struct_archive,
    reading: bool = false,

    pub fn init(this: *BufferReadStream, buf: []const u8) void {
        this.* = BufferReadStream{
            .buf = buf,
            .pos = 0,
            .archive = lib.archive_read_new(),
            .reading = false,
        };
    }

    pub fn deinit(this: *BufferReadStream) void {
        _ = lib.archive_read_close(this.archive);
        _ = lib.archive_read_free(this.archive);
    }

    pub fn openRead(this: *BufferReadStream) c_int {
        // lib.archive_read_set_open_callback(this.archive, this.);
        // _ = lib.archive_read_set_read_callback(this.archive, archive_read_callback);
        // _ = lib.archive_read_set_seek_callback(this.archive, archive_seek_callback);
        // _ = lib.archive_read_set_skip_callback(this.archive, archive_skip_callback);
        // _ = lib.archive_read_set_close_callback(this.archive, archive_close_callback);
        // // lib.archive_read_set_switch_callback(this.archive, this.archive_s);
        // _ = lib.archive_read_set_callback_data(this.archive, this);

        this.reading = true;

        _ = lib.archive_read_support_format_tar(this.archive);
        _ = lib.archive_read_support_format_gnutar(this.archive);
        _ = lib.archive_read_support_filter_gzip(this.archive);
        _ = lib.archive_read_support_filter_none(this.archive);

        const rc = lib.archive_read_open_memory(this.archive, this.buf.ptr, this.buf.len);

        // _ = lib.archive_read_support_compression_all(this.archive);

        return rc;
    }

    pub inline fn bufLeft(this: BufferReadStream) []const u8 {
        return this.buf[this.pos..];
    }

    pub inline fn fromCtx(ctx: *c_void) *Stream {
        return @ptrCast(*Stream, @alignCast(@alignOf(*Stream), ctx));
    }

    pub fn archive_close_callback(
        archive: *struct_archive,
        ctx_: *c_void,
    ) callconv(.C) c_int {
        return 0;
    }

    pub fn archive_read_callback(
        archive: *struct_archive,
        ctx_: *c_void,
        buffer: [*c]*const c_void,
    ) callconv(.C) lib.la_ssize_t {
        var this = fromCtx(ctx_);
        const remaining = this.bufLeft();
        if (remaining.len == 0) return 0;

        const diff = std.math.min(remaining.len, this.block_size);
        buffer.* = remaining[0..diff].ptr;
        this.pos += diff;
        return @intCast(isize, diff);
    }

    pub fn archive_skip_callback(
        archive: *struct_archive,
        ctx_: *c_void,
        offset: lib.la_int64_t,
    ) callconv(.C) lib.la_int64_t {
        var this = fromCtx(ctx_);

        const buflen = @intCast(isize, this.buf.len);
        const pos = @intCast(isize, this.pos);

        const proposed = pos + offset;
        const new_pos = std.math.min(std.math.max(proposed, 0), buflen - 1);
        this.pos = @intCast(usize, this.pos);
        return new_pos - pos;
    }

    pub fn archive_seek_callback(
        archive: *struct_archive,
        ctx_: *c_void,
        offset: lib.la_int64_t,
        whence: c_int,
    ) callconv(.C) lib.la_int64_t {
        var this = fromCtx(ctx_);

        const buflen = @intCast(isize, this.buf.len);
        const pos = @intCast(isize, this.pos);

        switch (@intToEnum(Seek, whence)) {
            Seek.current => {
                const new_pos = std.math.max(std.math.min(pos + offset, buflen - 1), 0);
                this.pos = @intCast(usize, new_pos);
                return new_pos;
            },
            Seek.end => {
                const new_pos = std.math.max(std.math.min(buflen - offset, buflen), 0);
                this.pos = @intCast(usize, new_pos);
                return new_pos;
            },
            Seek.set => {
                const new_pos = std.math.max(std.math.min(offset, buflen - 1), 0);
                this.pos = @intCast(usize, new_pos);
                return new_pos;
            },
        }
    }

    // pub fn archive_write_callback(
    //     archive: *struct_archive,
    //     ctx_: *c_void,
    //     buffer: *const c_void,
    //     len: usize,
    // ) callconv(.C) lib.la_ssize_t {
    //     var this = fromCtx(ctx_);
    // }

    // pub fn archive_close_callback(
    //     archive: *struct_archive,
    //     ctx_: *c_void,
    // ) callconv(.C) c_int {
    //     var this = fromCtx(ctx_);
    // }
    // pub fn archive_free_callback(
    //     archive: *struct_archive,
    //     ctx_: *c_void,
    // ) callconv(.C) c_int {
    //     var this = fromCtx(ctx_);
    // }

    // pub fn archive_switch_callback(
    //     archive: *struct_archive,
    //     ctx1: *c_void,
    //     ctx2: *c_void,
    // ) callconv(.C) c_int {
    //     var this = fromCtx(ctx1);
    //     var that = fromCtx(ctx2);
    // }
};

pub const Archive = struct {
    // impl: *lib.archive = undefined,
    // buf: []const u8 = undefined,
    // dir: FileDescriptorType = 0,

    pub fn extractToDisk(file_buffer: []const u8, root: []const u8, comptime depth_to_skip: usize, comptime close_handles: bool) !void {
        var entry: *lib.archive_entry = undefined;
        var ext: *lib.archive = undefined;

        const flags = @enumToInt(Flags.Extract.time) | @enumToInt(Flags.Extract.perm) | @enumToInt(Flags.Extract.acl) | @enumToInt(Flags.Extract.fflags);
        var stream: BufferReadStream = undefined;
        stream.init(file_buffer);
        defer stream.deinit();
        _ = stream.openRead();
        var archive = stream.archive;

        const cwd = std.fs.cwd();
        const dir = try cwd.makeOpenPath(root, .{ .iterate = true });
        defer if (comptime close_handles) dir.close();

        loop: while (true) {
            const r = @intToEnum(Status, lib.archive_read_next_header(archive, &entry));

            switch (r) {
                Status.eof => break :loop,
                Status.failed, Status.fatal, Status.retry => return error.Fail,
                else => {
                    var pathname: [:0]const u8 = std.mem.sliceTo(lib.archive_entry_pathname_utf8(entry).?, 0);
                    var tokenizer = std.mem.tokenize(u8, std.mem.span(pathname), std.fs.path.sep_str);
                    comptime var depth_i: usize = 0;
                    inline while (depth_i < depth_to_skip) : (depth_i += 1) {
                        if (tokenizer.next() == null) continue :loop;
                    }

                    var pathname_ = tokenizer.rest();
                    pathname = std.mem.sliceTo(pathname_.ptr[0..pathname_.len :0], 0);
                    const dirname = std.fs.path.dirname(std.mem.span(pathname)) orelse "";

                    const mask = lib.archive_entry_filetype(entry);

                    if (lib.archive_entry_size(entry) > 0) {
                        Output.prettyln("<r><d>{s}/<r>{s}", .{ root, pathname });

                        const file = dir.createFileZ(pathname, .{ .truncate = true }) catch |err| brk: {
                            switch (err) {
                                error.FileNotFound => {
                                    const subdir = try dir.makeOpenPath(dirname, .{ .iterate = true });
                                    defer if (comptime close_handles) subdir.close();
                                    break :brk try dir.createFileZ(pathname, .{ .truncate = true });
                                },
                                else => {
                                    return err;
                                },
                            }
                        };
                        defer if (comptime close_handles) file.close();
                        _ = lib.archive_read_data_into_fd(archive, file.handle);
                        _ = C.fchmod(file.handle, lib.archive_entry_perm(entry));
                    }
                },
            }
        }
    }
};
